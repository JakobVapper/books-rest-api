import express from 'express';
import { PrismaClient } from "@prisma/client";

const PORT = 3000;
const app = express();
const prisma = new PrismaClient();

app.use(express.json());

app.get('/books', async (req, res) => {
    const books = await prisma.books.findMany();
    res.status(200).json(books);
});

app.get('/books/:id', async (req, res) => {
    console.log(typeof req.params.id);

    try{
        const book = await prisma.books.findUnique({
            where : {
                id: Number(req.params.id),
            }
        });

        res.status(200).json(book);
    } catch(err){
        res.status(404).send({
            message: "Midagi läks valesti",
            error,
        })
    }
});

app.delete('/books/:id', async (req, res) => {
    try{
        const deletedBook = await prisma.books.delete ({
            where: {
                id: Number(req.params.id),
            }})
    }catch(err){
        res.status(404).send({
            message: "Midagi läks valesti",
            error,
        })
    }
});

app.post('/books', async (req, res) => {
    try {
        const newBook = await prisma.books.create({
            data: { ...req.body },
        });

        res.status(200).json(newBook);

    }catch (err) {
        res.status(404).send({
            message: "Midagi läks valesti",
            error,
        }
    )}});    

app.put ('/books', async (req, res) => {
    try {
        const newBook = await prisma.books.create({
            data: { ...req.body },
        });
    
        res.status(200).json(newBook);
    
    }catch (err) {
        res.status(404).send({
            message: "Midagi läks valesti",
            error,
        }
    )}});       

    
app.listen(PORT, () => {
    console.log(`Server listening at port ${PORT}`);
});

