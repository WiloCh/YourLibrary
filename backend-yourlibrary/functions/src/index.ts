import * as functions from "firebase-functions";
import * as express from "express";
import { createBook, listBooks } from "./controllers/bookController";
import { createAuthor, listAthorsByBook } from "./controllers/authorController";

const app = express()

app.get('/', (req, res) => res.status(200).send('Hey There!'))

app.post('/books', createBook)
app.get('/books/:page/:limit', listBooks)

app.post('/authors', createAuthor)
app.get('/authors/:idbook', listAthorsByBook)

exports.app = functions.https.onRequest(app);
