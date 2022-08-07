import db from "../config/db.js";
import chalk from "chalk";

export async function getUser(req,res){
    const { user } = res.locals;
    try {
        const userData = await db.query(
            `SELECT * FROM users
            WHERE id = $1`,[user.id]
        );
        if(userData.rowCount===0){
            res.status(404).send("User does not exist!");
            return;
        }
        const views= await db.query(
            `SELECT SUM(urls."viewsCount") AS "visitCount"
            FROM urls
            WHERE "userId" = $1
            `,[user.id]
        );
        const [visitCount]=views.rows;
        const {rows: shortenedUrls} = await db.query(
            `SELECT id,
            "shortUrl",
            "longUrl" AS url,
            "viewsCount" AS "visitCount"
            FROM urls
            WHERE "userId" = $1`,[user.id]
        );
        const response = {
            id:user.id,
            name: user.name,
            visitCount: visitCount.sum || 0,
            shortenedUrls:shortenedUrls
        }
        res.status(200).send(response);
        return;
    } catch (error) {
        console.log(chalk.bold.red("Erro no servidor!"));
        res.status(500).send({
          message: "Internal server error while get user data!",
        });
        return;     
    }
    
}

export async function getRanking(req,res){
    try {
        const {rows: ranking} = await db.query(
            `SELECT users.id,
            name,
            COUNT(urls."userId") AS "linksCount",
            SUM(urls."viewsCount") AS "visitCount"
            FROM users
            JOIN urls 
            ON urls."userId"= users.id
            GROUP BY users.id
            ORDER BY "visitCount"
            LIMIT 10;
            `
        );
        res.status(200).send(ranking);
        return;
    } catch (error) {
        console.log(chalk.bold.red("Erro no servidor!"));
        res.status(500).send({
          message: "Internal server error while get ranking!",
        });
        return; 
    }
}