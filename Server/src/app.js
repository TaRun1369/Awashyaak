const express = require("express");
const app = express();
require('dotenv').config();
const port = process.env.PORT || 2700;
require("../db/conn");
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
const Seller = require("../routes/seller")
const Customer = require("../routes/user")
app.use(Seller);
app.use(Customer);
app.listen(port,()=>{
    console.log(`Connection Successful with ${port}`);
})
