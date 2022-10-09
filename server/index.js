const express = require('express');
const http = require('http');
const mongoose = require('mongoose');


const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require('./models/room');

var io = require('socket.io')(server);

//middleware
app.use(express.json());

const DB = "mongodb+srv://asish918:mongodb918@cluster0.7u7sddq.mongodb.net/?retryWrites=true&w=majority";

io.on('connection', (socket) => {
    console.log("Connected...");
    socket.on('createRoom', async ({ nickname }) => {
        console.log(`${nickname}`);
        console.log(socket.id);

        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname,
                playerType: 'X',
            };
    
            room.players.push(player);
            room.turn = player;
             
            room = await room.save();
    
            const roomId = room._id.toString();
            socket.join(roomId);
            io.to(roomId).emit("createRoomSuccess", room);
        } catch (error) {
            console.log(error);
        }

    })
});
 
mongoose.connect(DB).then(() => {
    console.log("MongoDB connection successful...")
}).catch((e) => console.log(e));

server.listen(port, '0.0.0.0', () => {
    console.log(`Server created and started on port ${port}...`);
});
