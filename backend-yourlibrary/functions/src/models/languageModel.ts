export interface Language {
    name: string,
    origin: string
}

export function Language(data: any) {
    const { name, origin } = data;

    let object: Language = {
        name: name,
        origin: origin
    };
    return object;
}
