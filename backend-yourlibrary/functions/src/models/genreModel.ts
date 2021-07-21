export interface Genre {
    name: string,
    description: string
}

export function Genre(data: any){
    const { name, description } = data;

    let object: Genre = {
        name: name,
        description: description
    };
    return object;
}