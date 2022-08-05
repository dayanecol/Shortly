import { Router } from "express";
import authRouter from "./authRouter.js";
import urlsRouter from "./urlsRouter.js";
import usersRouter from "./usersRoutes.js";

const router = Router();

router.use(authRouter);
router.use(urlsRouter);
router.use(usersRouter); 

export default router;