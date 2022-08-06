import db from "../config/db.js";

export async function validateToken(req,res,next){
    const { authorization } = req.headers;
    const token = authorization?.replace("Bearer ", "");

    if(!token){
        res.sendStatus(401);
        return;
    }

    try {
        const { rows:sessions } = await db.query(
            `SELECT * FROM sessions WHERE token = $1`,[token]
        );
        const [session]=sessions;
        if(!session){
            res.sendStatus(401);
            return;
        }
        const { rows: users } = await db.query(
            `SELECT * FROM users WHERE id = $1 `, [session.userId]
        );
        const [user]= users;
        if (!user){
            res.sendStatus(401);
            return;
        }
        res.locals.user = user;
        next();
    } catch (error) {
        console.log(chalk.bold.red("Erro no servidor!"));
        res.status(500).send({
          message: "Internal server error while validate session!",
        });
        return; 
    }
}