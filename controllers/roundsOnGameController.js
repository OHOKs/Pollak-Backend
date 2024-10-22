const connect = require("../config/db");

const getAllRoundsOnGames = async (req, res) => {
    try{
        const users = await new Promise(async (resolve, reject) => {
            connect.query("SELECT * FROM `roundsongame`", (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const getRoundOnGameById = async (req, res) => {
    
    const gameId = req.params.gameid; 
    
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `roundsongame` WHERE `gameId` = ?", [gameId],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createRoundsOnGame = async (req, res) => {

    const roundId = req.body.roundId;
    const gameId = req.body.gameId;  
    
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("INSERT INTO `roundsongame` (`roundId`, `gameId`) VALUES (?, ?);", [roundId, gameId],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const deleteRoundsOnGame = async (req, res) => {

    const roundId = req.body.roundId;
    const gameId = req.body.gameId; 

    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("DELETE FROM `roundsongame` WHERE `roundsongame`.`roundId` = ? AND `roundsongame`.`gameId` = ?", [roundId, gameId],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

module.exports = {
    getAllRoundsOnGames,
    getRoundOnGameById,
    createRoundsOnGame,
    deleteRoundsOnGame
}
