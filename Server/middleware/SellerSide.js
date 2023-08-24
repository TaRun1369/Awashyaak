const jwt = require("jsonwebtoken");
const express = require("express");
const Seller = require("../models/seller");
const AuthSeller = async(req,res,next) =>{
      try{
        const token = req.header("Authorization").replace("Bearer ", "");
        const verifySeller = jwt.verify(token,process.env.SECRET_KEY);
        const SellerFound = await Seller.findOne({_id:verifySeller._id});
        console.log(SellerFound);
        next();

      }catch(err){
        res.status(400).send("authentication failed"+err);
      }
}
module.exports = AuthSeller;