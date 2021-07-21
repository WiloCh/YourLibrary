export interface Author {
    idauthor?: string,
    names: string,
    surnames: string,
    placeBorn: string,
    dateBorn: string,
    idbook: string
}

export function Author(data: any, id?:string) {
    const { names, surnames, placeBorn, dateBorn, idbook } = data;

    let object: Author = {
        idauthor: id,
        names: names,
        surnames: surnames,
        placeBorn: placeBorn,
        dateBorn: dateBorn,
        idbook: idbook
    };
    return object;
}


