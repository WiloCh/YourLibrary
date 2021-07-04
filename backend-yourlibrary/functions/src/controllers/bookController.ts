import { Response } from "express";
import { db } from "../config/firebase";
import { BookType } from "../models/bookModel";

type Request = {
    body: BookType,
    params: { bookId: string}
}

const addBook = async (req: Request, res: Response) => {
    const {title, author, editorial, pagNum, pagRead, description, photo} = req.body
    try {
        const book = db.collection('books').doc()
        const bookObject = {
            id: book.id,
            title,
            author,
            editorial,
            pagNum,
            pagRead,
            description,
            photo
        }

        book.set(bookObject)

        res.status(200).send({
            status: "success",
            message: "libro añadido correctamente",
            data: bookObject
        })
    }catch(error) {
        res.status(500).json(error.message)
    }
}

const getAllBooks = async (req: Request, res:Response) => {
    try{
        const allBooks: BookType[] = []
        const querySnapshot = await db.collection('books').get()
        querySnapshot.forEach((doc: any) => allBooks.push(doc.data()))

        return res.status(200).json(allBooks)
    }catch (error) { 
        return res.status(500).json(error.message)
    }
}

export { addBook, getAllBooks }