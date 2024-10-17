const connect = require("../config/db");

const getAllRounds = async (req, res) => {
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `round`", (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const getRoundById = async (req, res) => {
    
    const id = req.params.id; 

    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `round` WHERE `id` = ?", [id],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createRound = async (req, res) => {

};

const updateRound = async (req, res) => {

};

const deleteRound = async (req, res) => {

};

module.exports = {
    getAllRounds,
    getRoundById,
    createRound,
    updateRound,
    deleteRound
}
