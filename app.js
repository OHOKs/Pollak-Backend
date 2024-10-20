const express = require("express");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");

const { checkSessionMiddleware }= require("./middlewares/sessionHandler");
const { checkTokenMiddleware } = require("./middlewares/tokenHandler");
const { login, register, logout } = require("./controllers/authController") 

const userRoutes = require("./routes/userRoutes");
const teamRoutes = require("./routes/teamRoutes");
const gameRoutes = require("./routes/gameRoutes");
const roundRoutes = require("./routes/roundRoutes");

dotenv.config();
const app = express();

//session

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json()); 

app.use('/user', userRoutes);
app.use('/team', teamRoutes);
app.use('/game', gameRoutes);
app.use('/round', roundRoutes);

//app.use(checkSessionMiddleware)
//app.use(checkTokenMiddleware)
//app.post("/register", register);
//app.post("/login", login);
//app.post("/logout", logout)

const PORT = process.env.PORT || 3000;
app.listen(PORT,() => {
    console.log(`Server is running at http://localhost:${PORT}`);
});