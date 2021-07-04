import * as functions from "firebase-functions";
import * as express from "express";
import { addBook, getAllBooks } from "./controllers/bookController";
import { addLanguage, getAllLanguages } from "./controllers/languageController";
import { addGenre, getAllGenres } from "./controllers/genreController";
import { addAuthor, getAllAuthors } from "./controllers/authorController";

const app = express()

app.get('/', (req, res) => res.status(200).send('Hey There!'))
app.post('/books', addBook)
app.get('/books', getAllBooks)
app.post('/languages', addLanguage)
app.get('/languages', getAllLanguages)
app.post('/genres', addGenre)
app.get('/genres', getAllGenres)
app.post('/authors', addAuthor)
app.get('/authors', getAllAuthors)

exports.app = functions.https.onRequest(app);
