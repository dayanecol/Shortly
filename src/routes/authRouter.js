import { Router } from "express";
import { signUp } from "../controllers/authController.js";
import { validateSignUp } from "../middlewares/validateAuthMiddleware.js";

const authRouter = Router();

authRouter.post("/signin");

authRouter.post("/signup", validateSignUp , signUp);

export default authRouter;