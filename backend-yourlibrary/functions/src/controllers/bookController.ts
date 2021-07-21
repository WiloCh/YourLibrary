import { Request,  Response} from "express";
import { Book } from "../models/bookModel";
import { db } from "../config/firebase";
import { Message } from "../models/messageModel";

const collection = "books";

export async function createBook(req: Request, res: Response) {
    try{
        const newBook = Book(req.body);
        const bookAdded = await db.collection(collection).add(newBook);
        return res.status(201).json(Message('Libro agregado', `libro agregado con el id ${bookAdded.id}`, 'success'));
    }catch(err){
        return res.status(500).json(err.message)
    }
}

export async function listBooks(req: Request, res: Response) {
    try{
        let page = parseInt(req.params.page);
        let limit = parseInt(req.params.limit);
        let avoid = page == 1 ? 0 : (page - 1) * limit;
        let snapshot = await db.collection(collection).orderBy('title').offset(avoid).limit(limit).get();
        return res.status(200).json(snapshot.docs.map(doc => Book(doc.data(), doc.id)));
    }catch(err){
        return res.status(500).json(err.message)
    }
}