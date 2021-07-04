import { Response } from "express";
import { db } from "../config/firebase";
import { GenreType } from "../models/genreModel";

type Request = {
    body: GenreType,
    params: { genreId: string}
}

const addGenre = async (req: Request, res: Response) => {
    const {name, description} = req.body
    try {
        const genre = db.collection('genres').doc()
        const genreObject = {
            id: genre.id,
            name,
            description
        }

        genre.set(genreObject)

        res.status(200).send({
            status: "success",
            message: "Genero añadido correctamente",
            data: genreObject
        })
    }catch(error) {
        res.status(500).json(error.message)
    }
}

const getAllGenres = async (req: Request, res:Response) => {
    try{
        const allGenres: GenreType[] = []
        const querySnapshot = await db.collection('genres').get()
        querySnapshot.forEach((doc: any) => allGenres.push(doc.data()))

        return res.status(200).json(allGenres)
    }catch (error) { 
        return res.status(500).json(error.message)
    }
}

export { addGenre, getAllGenres}