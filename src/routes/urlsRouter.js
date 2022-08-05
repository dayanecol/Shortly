import { Router } from "express";

const urlsRouter = Router();

urlsRouter.post("/urls/shorten");

urlsRouter.get("/urls/:id");

urlsRouter.get("/urls/open/:shortUrl");

urlsRouter.delete("/urls/:id");

export default urlsRouter;