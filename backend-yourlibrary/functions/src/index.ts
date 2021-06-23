import * as functions from "firebase-functions";
import * as express from "express";
import {addBook, listBooks} from './entryController'

const app = express()

app.get('/', (req, res) => res.status(200).send('Hey ther!'))
app.post('/books', addBook)
app.get('/books', listBooks)

exports.app  = functions.https.onRequest(app);

