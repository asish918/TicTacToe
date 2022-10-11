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

        socket.on('joinRoom', async ({ nickname, roomID }) => {
            try {
                if(!roomID.match(/^[0-9a-fA-F]{24}$/)) {
                    socket.emit('errorOccured', 'Please enter a valid room ID');
                    return;
                }
                
                let room = await Room.findById(roomID);

                if(room.isJoin) {
                    let player = {
                        nickname,
                        socketID: socket.id,
                        playerType: 'O'
                    }

                    socket.join(roomID);
                    room.players.push(player);
                    room.isJoin = false;
                    room = await room.save();
                    io.to(roomId).emit("joinRoomSuccess", room);
                    io.to(roomId).emit("updatePlayers", room.players);

                } else {
                    socket.emit('errorOccured', 'The game is in progress, try again later');
                }
                
            } catch (error) {
                console.log(error);
            }
        });

    })
});
 
mongoose.connect(DB).then(() => {
    console.log("MongoDB connection successful...")
}).catch((e) => console.log(e));

server.listen(port, '0.0.0.0', () => {
    console.log(`Server created and started on port ${port}...`);
});
