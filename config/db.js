require('dotenv').config(); 
var mysql = require('mysql');

var connect = mysql.createConnection({
    host: process.env.DB_HOST,
    port: process.env.DB_POST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,
});

module.exports = connect;