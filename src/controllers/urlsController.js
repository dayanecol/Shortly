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

export async function getShortUrl(req,res){
    const { id } = req.params;

    try {
        const idExist = await db.query(
            `SELECT * FROM urls
            WHERE id= $1`,[id]
        );
        if (idExist.rowCount===0){
            res.status(404).send("URL not found!");
            return;
        }
        const { rows: urls } = await db.query(
            `SELECT id, "shortUrl", "longUrl"
            FROM urls
            WHERE id = $1`,[id]
        );
        const [url]=urls;
        const response = {
            id: url.id,
            shortUrl:url.shortUrl,
            url:url.longUrl
        };
        res.status(200).send(response);
        return;

    } catch (error) {
        console.log(chalk.bold.red("Erro no servidor!"));
        res.status(500).send({
          message: "Internal server error while get URL!",
        });
        return; 
    }
}

export async function openShortUrl(req,res){

}

export async function deleteUrl(req,res){

}