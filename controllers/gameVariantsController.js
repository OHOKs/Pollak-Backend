const connect = require("../config/db");

const getAllGameVariants = async (req, res) => {
    try{
        const users = await new Promise(async (resolve, reject) => {
            connect.query("SELECT * FROM `gamevariants`", (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const getGameVariantByGameId = async (req, res) => {
    
    const gameId = req.params.gameid; 
    
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `gamevariants` WHERE `gameId` = ?", [gameId],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createGameVariant = async (req, res) => {

    const variantId = req.body.variantId;
    const gameId = req.body.gameId; 
    const typeId = req.body.typeId;  
    
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("INSERT INTO `gamevariants` (`variantId`, `gameId`, `typeId`) VALUES (?, ?, ?);", [variantId, gameId,typeId],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const deleteGameVariant = async (req, res) => {

    const variantId = req.body.variantId;
    const gameId = req.body.gameId; 
    const typeId = req.body.typeId; 

    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("DELETE FROM `gamevariants` WHERE `gamevariants`.`gameId` = ? AND `gamevariants`.`variantId` = ? AND `gamevariants`.`typeId` = ?", [gameId, variantId,typeId],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

module.exports = {
    getAllGameVariants,
    getGameVariantByGameId,
    createGameVariant,
    deleteGameVariant
}
