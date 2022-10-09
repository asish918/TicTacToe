const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);

var io = require('socket.io')(server);

//middleware
app.use(express.json());

const DB = "mongodb+srv://asish918:mongodb918@cluster0.7u7sddq.mongodb.net/?retryWrites=true&w=majority";

io.on('connection', (socket) => {
    console.log("Connected...");
});
 
mongoose.connect(DB).then(() => {
    console.log("MongoDB connection successful...")
}).catch((e) => console.log(e));

server.listen(port, '0.0.0.0', () => {
    console.log(`Server created and started on port ${port}...`);
});
