const mongoose = require("mongoose");
mongoose.set('strictQuery', false);
mongoose.connect(process.env.CONNECTION_KEY).then(()=>{
    console.log("Connected to dataBase")
}).catch((err)=>{
    console.log(err);
})
//mongodb+srv://INC1234:MCSunay@cluster0.ddicrvg.mongodb.net/INC-Database?retryWrites=true&w=majority
//mongodb://INC1234:MCSunay@ac-gohxbzy-shard-00-00.ddicrvg.mongodb.net:27017,ac-gohxbzy-shard-00-01.ddicrvg.mongodb.net:27017,ac-gohxbzy-shard-00-02.ddicrvg.mongodb.net:27017/INC-Database?ssl=true&replicaSet=atlas-do5uk8-shard-0&authSource=admin&retryWrites=true&w=majority