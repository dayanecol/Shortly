import joi from "joi";


export const signUpSchema = joi.object({
    name:joi.string().trim().max(50).required(),
    email:joi.string().email().trim().max(50).required(),
    password:joi.string().required(),
    confirmPassword: joi.ref('password')
});

export const signInSchema = joi.object({
    email:joi.string().email().trim().max(50).required(),
    password: joi.string().required()
});