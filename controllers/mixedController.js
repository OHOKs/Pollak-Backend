const connect = require("../config/db");

const getDataForBrackets = async (req, res) => {
    try{
        const users = await new Promise(async (resolve, reject) => {
            connect.query(`
    SELECT 
       game.id AS game_id,
       game.name AS game_name,
       game.playerCount,
       game.playerPerTeam,
       game.requiredForPrize,
       game.createdAt AS game_createdAt,
       game.updatedAt AS game_updatedAt,
       variant.name AS variant_name,
       matchtype.type AS match_type
    FROM 
        game
    JOIN 
        gamevariants ON game.id = gamevariants.gameId
    JOIN 
        variant ON gamevariants.variantId = variant.id
    JOIN 
        matchtype ON gamevariants.typeId = matchtype.id;
`, (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

module.exports = {
    getDataForBrackets
}
