import { Router } from "express";
import { shorten } from "../controllers/urlsController.js";  
import { validateToken } from "../middlewares/validadeTokenMiddleware.js";
import { validateUrl } from "../middlewares/validateUrlMiddleware.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten", validateUrl, validateToken, shorten);

urlsRouter.get("/urls/:id");

urlsRouter.get("/urls/open/:shortUrl");

urlsRouter.delete("/urls/:id");

export default urlsRouter;