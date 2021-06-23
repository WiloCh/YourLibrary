import {Response} from 'express'
import {db} from './config/firebase'

type EntryType = {
    title: string,
    author: string,
    editorial: string,
    pagNum: string,
    pagRead: string,
    description: string,
    photo: string
}

type Request = {
    body: EntryType,
    params: {entryId: string}
}

const addBook = async (req: Request, res: Response) => {
    const{title, author, editorial, pagNum, pagRead, description, photo} = req.body
    try{
        const entry = db.collection('books').doc()
        const entryObject = {
            id: entry.id,
            title,
            author,
            editorial,
            pagNum,
            pagRead,
            description,
            photo
        }

        entry.set(entryObject)

        res.status(200).send({
            status: 'success',
            message: 'entry added successfully',
            data: entryObject
        })
    }catch(error){
        res.status(500).json(error.message)
    }
}

const listBooks = async (req: Request, res: Response) => {
    try{
        const allEntries: EntryType[] = []
        const querySnapshot = await db.collection('books').get()
        querySnapshot.forEach((doc: any) => allEntries.push(doc.data()))

        return res.status(200).json(allEntries)
    }catch (error) {
        return res.status(500).json(error.message)
    }
}

export {addBook, listBooks}