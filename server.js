import express from 'express';
import { PrismaClient } from "@prisma/client";

const PORT = 3000;
const app = express();
const prisma = new PrismaClient();

app.get('/books', async (req, res) => {
    const books = await prisma.books.findMany();
    res.status(200).json(books);
});

app.get('/', (request, response) => {
    response.send('hello world');
});

app.listen(PORT, () => {
    console.log(`Server listening at port ${PORT}`);
});