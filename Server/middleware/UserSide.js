const jwt = require("jsonwebtoken");
const User = require("../models/users");
const AuthUser = async(req,res,next)=>{
    try{
        const token = req.header("Authorization").replace("Bearer ", "");
        const verifyUser = jwt.verify(token,process.env.SECRET_KEY);
        const UserFound = await User.findOne({_id:verifyUser._id});
        console.log(UserFound);
        next();
    }
    catch(err){
        res.status(400).send("authentication failed"+err);
    }
}

module.exports = AuthUser;