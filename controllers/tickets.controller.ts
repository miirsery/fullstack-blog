import { Request, Response } from 'express'
import moment from 'moment'
const {
  getAll,
  getFilteredTickets,
  getComparisonTickets,
  getEqualsTickets,
  getFilteredOnSessionTickets,
  addTicket,
  getComparisonTicketsWithSeller,
  getTicketsWithSeller,
  getTotal,
} = require('../repositories/tickets.repository.js')

const { transporter } = require('../utils/mailer.js')

const { updateSchema } = require('../repositories/halls.repository.js')

const { renderHtml } = require('../utils/makeHtml')

const getAllTickets = (response: any): Promise<any> => {
  return response.rows.map((ticket: any) => {
    const changedBuyDate = moment(ticket.buy_date).format('DD-MM-YYYY ; HH:MM:SS')

    delete ticket.buy_date

    return Object.assign(ticket, { buy_date: changedBuyDate })
  })
}

class TicketsController {
  async getTickets(req: Request, res: Response) {
    try {
      const filter = req.query

      if (filter.user_id) {
        const ticketsData = await getFilteredTickets(filter.user_id).then(
          async (response: any) => await getAllTickets(response)
        )
        return res.status(200).setHeader('Content-Type', 'application/json').json(ticketsData)
      }

      if (filter.session_id) {
        const ticketsData = await getFilteredOnSessionTickets(filter.session_id).then(
          async (response: any) => await getAllTickets(response)
        )
        return res.status(200).setHeader('Content-Type', 'application/json').json(ticketsData)
      }

      if (filter.comparison && filter.seller_id) {
        const ticketsData = await getComparisonTicketsWithSeller(+filter.comparison, +filter.seller_id).then(
          async (response: any) => await getAllTickets(response)
        )

        return res.status(200).setHeader('Content-Type', 'application/json').json(ticketsData)
      }

      if (filter.comparison) {
        const ticketsData = await getComparisonTickets(filter.comparison).then(
          async (response: any) => await getAllTickets(response)
        )

        return res.setHeader('Content-Type', 'application/json').status(200).json(ticketsData)
      }

      if (filter.seller_id) {
        const ticketData = await getTicketsWithSeller(filter.seller_id).then(
          async (response: any) => await getAllTickets(response)
        )

        return res.status(200).setHeader('Content-Type', 'application/json').json(ticketData)
      }

      if (filter.equals) {
        const ticketsData = await getEqualsTickets(filter.equals).then(
          async (response: any) => await getAllTickets(response)
        )

        return res.status(200).setHeader('Content-Type', 'application/json').json(ticketsData)
      } else {
        const ticketsCount = await getTotal()

        await getAll().then(async (response: any) => {
          const tickets = getAllTickets(response)

          return res.status(200).setHeader('Content-Type', 'application/json').json({
            tickets_count: ticketsCount.rows[0].count,
            items: tickets,
          })
        })
      }
    } catch (error: any) {
      console.log(error)
      return res
        .status(500)
        .setHeader('Content-Type', 'application/json')
        .json({
          message: error.detail,
        })
        .end('Cannot ' + req.method + ' ' + req.url)
    }
  }

  async addTicket(req: Request, res: Response) {
    try {
      const body = req.body

      await addTicket(body)

      await updateSchema(body.seat, body.session_id, body.user_id)

      await transporter.sendMail({
        from: 'nikiforov.byrip@yandex.ru',
        to: 'sania.nika@mail.ru',
        subject: 'Message from Node js',
        text: 'This message was sent from Node js server.',
        html: renderHtml(body.email),
      })

      return res.status(200).setHeader('Content-Type', 'application/json').json({
        message: 'Успешно',
      })
    } catch (error: any) {
      console.log(error)
      return res
        .status(500)
        .setHeader('Content-Type', 'application/json')
        .json({
          message: error.detail,
        })
        .end('Cannot ' + req.method + ' ' + req.url)
    }
  }
}

module.exports = new TicketsController()
