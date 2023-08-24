const mongoose = require("mongoose");
const validator = require("validator");
const jwt = require("jsonwebtoken");
const UserSchema = new mongoose.Schema({
    name:{
        type:String,
        required : true
    },
    mobile:{
        type:Number,
        required:true
    },
    email:{
        type:String,
        unique:[true,"Email already exists"],
        validate(value){
            if(!validator.isEmail(value)){
                throw new error("Invalid E-mail id");
            }
        } 
    },
    password:{
        type:String,
        required:true
    },
    cpassword:{
        type:String,
        required: true
    },
    tokens:[{
        token:String,
        // required:true
    }]

})
UserSchema.methods.generateAuthToken = async function(){
    try{
        console.log(this.id);
        const token = jwt.sign({_id:this._id},"DevelopersAreSunayTarunDarshanPranav");
        this.tokens = this.tokens.concat({token:token});
        await this.save();
        return token;
    }catch(err){
        res.send(err);
        console.log(err);
    }
}
const User = mongoose.model("User",UserSchema);
module.exports = User;