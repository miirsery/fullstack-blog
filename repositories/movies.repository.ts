const db = require('../db')

module.exports = {
  createOne: async (movie: any) =>
    await db.query(
      'INSERT INTO movie' +
        ' (title,' +
        ' description,' +
        ' studio,' +
        ' genre,' +
        ' release_date,' +
        ' preview' +
        ') VALUES ($1, $2, $3, $4, $5, $6)',
      [movie.title, movie.description, movie.studio, movie.genre, movie.release_date, movie.pathToFile]
    ),
  findOne: async (id: number) => db.query('SELECT * FROM movie WHERE id=$1', [id]),
  findAll: async () =>
    db.query(
      'SELECT *, (SELECT CAST(COUNT(*) as INTEGER)' +
        ' FROM ticket' +
        ' WHERE ticket.movie_id = public.movie.id) AS sales_count' +
        ' FROM movie' +
        ' ORDER BY movie.id ASC'
    ),
  updateOne: async (args: any) =>
    db.query('UPDATE movie SET title=$1, preview=$2 WHERE id=$3', [args.title, args.preview, args.id]),
  getMostPopularMovie: () =>
    db.query(
      'SELECT *, MAX((SELECT CAST(COUNT(*) as INTEGER)' +
        ' FROM ticket' +
        ' WHERE ticket.movie_id = public.movie.id)) AS sales_count' +
        ' FROM movie' +
        ' GROUP BY movie.id' +
        ' LIMIT 1'
    ),
}