const connect = require("../config/db");

const getAllGames = async (req, res) => {
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `game`", (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const getGameById = async (req, res) => {
    
    const id = req.params.id; 

    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `game` WHERE `id` = ?", [id],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createGame = async (req, res) => {

};

const updateGame = async (req, res) => {

};

const deleteGame = async (req, res) => {

};

module.exports = {
    getAllGames,
    getGameById,
    createGame,
    updateGame,
    deleteGame
}
