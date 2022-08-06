import db from "../config/db.js";
import { nanoid } from "nanoid";
import chalk from "chalk";

export async function shorten(req,res){
    const { url } = req.body;
    const { id } = res.locals.user;
    
    const shortUrl = nanoid(8);

    try {
        await db.query(
            `INSERT INTO urls ("userId","longUrl", "shortUrl")
            VALUES ($1,$2,$3)`,[id, url, shortUrl]
        );
        res.status(201).send({shortUrl});
        return;
    } catch (error) {
        console.log(chalk.bold.red("Erro no servidor!"));
        res.status(500).send({
          message: "Internal server error while shorthen URL!",
        });
        return; 
    }
}