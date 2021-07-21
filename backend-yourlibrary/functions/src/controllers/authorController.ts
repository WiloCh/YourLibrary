import { Request,  Response} from "express";
import { db } from "../config/firebase";
import { Message } from "../models/messageModel";
import { Author } from "../models/authorModel"; 

const collection = "authors";

export async function createAuthor(req: Request, res: Response) {
    try{
        const newAuthor = Author(req.body);
        const authorAdded = await db.collection(collection).add(newAuthor);
        return res.status(201).json(Message('Autor agregado', `Autor fue agregado con el id ${authorAdded.id}`, 'success'));
    }catch(err){
        return res.status(500).json(err.message)
    }
}

export async function listAthorsByBook(req: Request, res: Response) {
    try{
        let idbook = req.params.idbook;
        let snapshot = await db.collection(collection).where('idbook', '==', idbook).get();
        return res.status(200).json(snapshot.docs.map(doc => Author(doc.data(), doc.id)));
    }catch(err){
        return res.status(500).json(err.message)
    }
}