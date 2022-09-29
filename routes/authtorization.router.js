const Router = require('express')
const router = Router.Router()
const authController = require('../controllers/auth.controller')
const initialPassport = require('../passport-config')
const passport = require('passport')
const db = require("../db");

initialPassport(
    passport,
    async (email) => {
        const data = await db.query(`SELECT * FROM person`)
        return data.rows.find(user => user.email === email)
    },
    async (id) => {
        const data = await db.query(`SELECT * FROM person`)
        return data.rows.find(user => user.id === id)
    }
)

router
    .post('/login', authController.checkNotAuthenticated, passport.authenticate('local', {
        successRedirect: '/',
        failureRedirect: '/api/login/failure',
        failureFlash: true
    }))
    .get('/login/failure', function (res, req) {
        req.send({
            status: 'Fail',
            message: 'Fail while auth'
        })
    })
    .post('/register', authController.register)


module.exports = router
