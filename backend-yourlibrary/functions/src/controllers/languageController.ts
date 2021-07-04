import { Response } from "express";
import { db } from "../config/firebase";
import { LanguageType } from "../models/languageModel";

type Request = {
    body: LanguageType,
    params: { languageId: string}
}

const addLanguage = async (req: Request, res: Response) => {
    const {name, origin} = req.body
    try {
        const language = db.collection('languages').doc()
        const languageObject = {
            id: language.id,
            name,
            origin
        }

        language.set(languageObject)

        res.status(200).send({
            status: "success",
            message: "Idioma añadido correctamente",
            data: languageObject
        })
    }catch(error) {
        res.status(500).json(error.message)
    }
}

const getAllLanguages = async (req: Request, res:Response) => {
    try{
        const allLanguages: LanguageType[] = []
        const querySnapshot = await db.collection('languages').get()
        querySnapshot.forEach((doc: any) => allLanguages.push(doc.data()))

        return res.status(200).json(allLanguages)
    }catch (error) { 
        return res.status(500).json(error.message)
    }
}

export { addLanguage, getAllLanguages}