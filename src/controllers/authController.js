import db from "../config/db.js";
import chalk from "chalk";
import bcrypt from "bcrypt";
import { v4 as uuid } from 'uuid';



export async function signUp(req,res){
    const {name,email,password, confirmPassword} = req.body;

    try {
        const repeatEmail = db.query(`SELECT * FROM users WHERE email = $1 `, [email]);
        if (repeatEmail.rowCount>0){
            res.status(409).send("E-mail already registered");
            return;
        }
        const hashPassword = bcrypt.hashSync(password, 10);

        await db.query(
            `INSERT INTO users (name, email, password)
            VALUES ($1,$2,$3)`,[name,email,hashPassword]
        );
        res.sendStatus(201);
        return;
            
    } catch (error) {
        console.log(chalk.bold.red("Erro no servidor!"));
        res.status(500).send({
          message: "Internal server error while register user!",
        });
        return;    
    }
}

export async function signIn(req,res){
    const { email, password}= req.body;
    const { rows:users } = await db.query(`SELECT * FROM users WHERE email = $1 `, [email]);
    const [user]=users;
    if (!user){
        res.sendStatus(401);
        return;
    }
    if(user && bcrypt.compareSync(password,user.password)){
        const token = uuid();
        await db.query(
            `INSERT INTO sessions (token, "userId") VALUES ($1, $2)`, [token, user.id]
        );
        return res.send({token});
    }
    res.sendStatus(401);
    return        
}