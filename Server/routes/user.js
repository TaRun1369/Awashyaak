const express = require("express");
const User = require('../models/users');
const Customer = express.Router();
const AuthUser = require("../middleware/UserSide");
const medicine = require("../models/medicine")
const Seller = require("../models/seller")
Customer.post("/Register",async(req,res)=>{
    try{
        const NewUser = new User({
            name:req.body.name,
            mobile:req.body.mobile,
            email:req.body.email,
            password:req.body.password,
            cpassword:req.body.cpassword
        })
        const UserCreated = await NewUser.save();
        const token = await UserCreated.generateAuthToken();
        console.log(token);
        res.send(UserCreated);
    }
    catch(err){
       res.status(400).send(err);

    }
})

Customer.post("/SignIn",async(req,res)=>{
    try{
        const email = req.body.email;
        const password = req.body.password;
        const Userfound = await User.findOne({email:email});
        if(Userfound.password===password){
            const token = await Userfound.generateAuthToken();
             res.send(Userfound); // send User on res
        }
        else{
            console.log("Password Doesn't match");
        }
    }
    catch(err){
        console.log("Invalid Details"+err);
    }
})

Customer.get("/search/:name",AuthUser,async(req,res)=>{
    try{const name = req.params.name;
    const id_Array = await medicine.find({name,Quantity:{$gte:1}},{Shopid:1,_id:0});
    console.log(id_Array);
    var array = [];
    id_Array.forEach(e => {
        array.push(e.Shopid);
    });
    const pointLat = req.body.latitude;
    const pointLong =req.body.longitude;

    const avail_Sellers = await Seller.find({_id:{$in :array}},{cpassword:0,password:0,tokens:0})
    avail_Sellers.sort((seller1, seller2) => {
        const lat1 = seller1.location.coordinates[0];
        const long1 = seller1.location.coordinates[1];
        const lat2 = seller2.location.coordinates[0];
        const long2 = seller2.location.coordinates[1];
    
        // Calculate the distance between each seller's location and the particular point using the Haversine formula
        const distance1 = getDistanceFromLatLonInKm(lat1, long1, pointLat, pointLong);
        const distance2 = getDistanceFromLatLonInKm(lat2, long2, pointLat, pointLong);
        if (distance1 > 5 || distance2 > 5) {
            return 0;
        }
    
        return distance1 - distance2;
    }
    );
    
    res.send(avail_Sellers);
    
    // Function to calculate the distance between two points using the Haversine formula
    function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
        const R = 6371; // Radius of the earth in km
        const dLat = deg2rad(lat2 - lat1);
        const dLon = deg2rad(lon2 - lon1);
        const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        const d = R * c; // Distance in km
        return d;
    }
    
    // Function to convert degrees to radians
    function deg2rad(deg) {
        return deg * (Math.PI / 180);
    }
    }catch(err){
        console.log(err);
    }
    
})

Customer.get("/search/:name/:quantity",AuthUser,async(req,res)=>{
    try{const name = req.params.name;
        const val = req.params.quantity;
    const id_Array = await medicine.find({name, Quantity:{$gte:val}},{Shopid:1,_id:0});
    console.log(id_Array);
    var array = [];
    id_Array.forEach(e => {
        array.push(e.Shopid);
    });
    const pointLat = req.body.latitude;
    const pointLong =req.body.longitude;

    const avail_Sellers = await Seller.find({_id:{$in :array}},{cpassword:0,password:0,tokens:0})
    avail_Sellers.sort((seller1, seller2) => {
        const lat1 = seller1.location.coordinates[0];
        const long1 = seller1.location.coordinates[1];
        const lat2 = seller2.location.coordinates[0];
        const long2 = seller2.location.coordinates[1];
    
        // Calculate the distance between each seller's location and the particular point using the Haversine formula
        const distance1 = getDistanceFromLatLonInKm(lat1, long1, pointLat, pointLong);
        const distance2 = getDistanceFromLatLonInKm(lat2, long2, pointLat, pointLong);
        if (distance1 > 5 || distance2 > 5) {
            return 0;
        }
    
        return distance1 - distance2;
    });
    
    res.send(avail_Sellers);
    
    // Function to calculate the distance between two points using the Haversine formula
    function getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
        const R = 6371; // Radius of the earth in km
        const dLat = deg2rad(lat2 - lat1);
        const dLon = deg2rad(lon2 - lon1);
        const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        const d = R * c; // Distance in km
        return d;
    }
    
    // Function to convert degrees to radians
    function deg2rad(deg) {
        return deg * (Math.PI / 180);
    }
    }catch(err){
        console.log(err);
    }
    
})
Customer.get("/ViewMedicine/:name/:id",AuthUser,async(req,res)=>{
    try{
        const id = req.params.id;
        const name = req.params.name;
        const medicine_details = await medicine.findOne({name,Shopid:id})
        res.send(medicine_details);
    }catch(err){
        console.log(err)
    }
})

module.exports = Customer;
