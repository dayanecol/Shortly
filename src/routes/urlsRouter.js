import { Router } from "express";
import { shorten, getShortUrl, openShortUrl, deleteUrl } from "../controllers/urlsController.js";  
import { validateToken } from "../middlewares/validadeTokenMiddleware.js";
import { validateUrl } from "../middlewares/validateUrlMiddleware.js";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten", validateUrl, validateToken, shorten);

urlsRouter.get("/urls/:id", getShortUrl);

urlsRouter.get("/urls/open/:shortUrl", openShortUrl);

urlsRouter.delete("/urls/:id",validateToken, deleteUrl);

export default urlsRouter;