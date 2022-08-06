import { Router } from "express";
import { signUp, signIn } from "../controllers/authController.js";
import { validateSignUp, validateSignIn } from "../middlewares/validateAuthMiddleware.js";

const authRouter = Router();

authRouter.post("/signin", validateSignIn, signIn);

authRouter.post('/signup', validateSignUp , signUp);

export default authRouter;