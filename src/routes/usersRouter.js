import { Router } from "express";
import { getUser, getRanking } from "../controllers/usersController.js";
import { validateToken } from "../middlewares/validadeTokenMiddleware.js";

const usersRouter = Router();

usersRouter.get("/users/me", validateToken, getUser);

usersRouter.get("/ranking", getRanking);

export default usersRouter;