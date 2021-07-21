export interface Book {
    idbook?: string,
    title: string,
    author: string,
    editorial: string,
    pagNum: string,
    pagRead: string,
    description: string,
    photo: string,
    genre: string,
}

export function Book(data: any, id?:string){
    const { title, author, editorial, pagNum, pagRead, description, photo, genre } = data;

    let objet: Book = {
        idbook: id,
        title: title,
        author: author,
        editorial: editorial,
        pagNum: pagNum,
        pagRead: pagRead,
        description: description,
        photo: photo,
        genre: genre
    };
    return objet;
}