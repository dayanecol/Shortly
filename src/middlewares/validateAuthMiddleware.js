import { signUpSchema,signInSchema } from "../schemas/authSchemas.js";

export async function validateSignUp (req, res, next) {
    const {error} = signUpSchema.validate(req.body,{ abortEarly: false });
    if(error) {
        res.status(422).send(error.details.map(detail => detail.message));
        return;
    }
    next();
}

export async function validateSignIn (req, res, next) {
    const {error} = signInSchema.validate(req.body,{ abortEarly: false });
    if(error) {
        res.status(422).send(error.details.map(detail => detail.message));
        return;
    }
    next();
}