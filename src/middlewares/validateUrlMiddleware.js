import urlSchema from "../schemas/urlsSchemas.js";

export async function validateUrl(req,res,next){
    const url = req.body;

    const { error } = urlSchema.validate(url, { abortEarly: false });
    if(error) {
        res.status(422).send(error.details.map(detail => detail.message));
        return;
    }
    next();
}