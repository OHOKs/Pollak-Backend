const connect = require("../config/db");

const getAllGamesForCards = async (req, res) => {
    try{
        const games = await new Promise(async (resolve, reject) => {
            connect.query(`
            SELECT 
                g.id AS game_id,
                g.name AS game_name,
                g.playerCount,
                g.playerPerTeam,
                g.requiredForPrize,
                g.createdAt AS game_createdAt,
                g.updatedAt AS game_updatedAt,
                g.status AS game_status,
                v.id AS variant_id,
                v.name AS variant_name,
                mt.id AS matchtype_id,
                mt.type AS match_type
            FROM 
                game g
            JOIN 
                gamevariants gv ON g.id = gv.gameId
            JOIN 
                variant v ON gv.variantId = v.id
            JOIN 
                matchtype mt ON gv.typeId = mt.id;
            `, (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(games);
    } catch (error){ res.status(500).json(error); }
};

const getDataForBrackets = async (req, res) => {

    const gameId = req.body.gameId;

    try{
        const games = await new Promise(async (resolve, reject) => {
            connect.query(``, (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(games);
    } catch (error){ res.status(500).json(error); }
};

module.exports = {
    getAllGamesForCards,
    getDataForBrackets
}
