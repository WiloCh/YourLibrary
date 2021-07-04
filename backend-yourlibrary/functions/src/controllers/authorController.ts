import { Response } from "express";
import { db } from "../config/firebase";
import { AuthorType } from "../models/authorModel";

type Request = {
    body: AuthorType,
    params: { authorId: string}
}

const addAuthor = async (req: Request, res: Response) => {
    const {names, surnames, placeBorn, dateBorn} = req.body
    try {
        const author = db.collection('authors').doc()
        const authorObject = {
            id: author.id,
            names,
            surnames,
            placeBorn,
            dateBorn
        }

        author.set(authorObject)

        res.status(200).send({
            status: "success",
            message: "Autor añadido correctamente",
            data: authorObject
        })
    }catch(error) {
        res.status(500).json(error.message)
    }
}

const getAllAuthors = async (req: Request, res:Response) => {
    try{
        const allAuthors: AuthorType[] = []
        const querySnapshot = await db.collection('authors').get()
        querySnapshot.forEach((doc: any) => allAuthors.push(doc.data()))

        return res.status(200).json(allAuthors)
    }catch (error) { 
        return res.status(500).json(error.message)
    }
}

export { addAuthor, getAllAuthors}