import express, {json} from "express";
import cors from "cors";
import chalk from "chalk";
import dotenv from "dotenv";
import router from "./routes/router.js";
// import db from "./config/db.js";
dotenv.config();

const app = express();
app.use(json());
app.use(cors());

app.use(router);

app.get("/",(req,res)=>{
    res.send("Esta no ar no heroku!");
});

const PORT = process.env.PORT || 5000;

app.listen(PORT,()=>{
    console.log(chalk.bold.green(`Servidor conectado na porta ${PORT}.`));
});