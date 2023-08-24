const mongoose = require("mongoose");
const validator = require("validator");
const jwt = require("jsonwebtoken")
const SellerSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true    
    },
    shopName:{
        type:String,
        required:true
    },
    address:{
        type:String,
        required:true
    },
    mobile:{
        type:Number,
        min:1000000000,
        max:9999999999,
        required:true,
        unique:[true,"Number already exist"]

    },
    email:{
        type:String,
        required:true,
        unique:[true,"Email already exists"],
        validate(value){
            if(!validator.isEmail(value)){
                throw new error("Invalid E-mail id");
            }
        } 
    },
    licence:{
        type:String,
        required:true,
        unique:[true,"User with Same Licence exist"]
    },
    location:{
        type: {
            type: String,
            enum: ['Point'],
            required: true
          },
          coordinates: {
            type: [Number],
            required: true
          }
    },
    placeId:{
        type:String,
        unique:[true,"Shop with Same placeId exists"]
    },
    password:{
        type:String,
        required:true
    },
    cpassword:{
        type:String,
        required:true
    },
    tokens:[{
        token:String,
        // required:true
    }]
   

})
SellerSchema.index({location:"2dsphere"});
SellerSchema.methods.generateAuthToken = async function(){
    try{
        // console.log(this.id);
        const token = jwt.sign({_id:this._id},process.env.SECRET_KEY);
        this.tokens = this.tokens.concat({token:token});
        await this.save();
        return token;
    }catch(err){
        res.send(err);
        console.log(err);
    }
}

const Seller = mongoose.model("Seller",SellerSchema);

module.exports = Seller;