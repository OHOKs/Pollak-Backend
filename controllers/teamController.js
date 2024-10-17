const connect = require("../config/db");

const getAllTeams = async (req, res) => {
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `team`", (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const getTeamById = async (req, res) => {
    
    const id = req.params.id; 

    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `team` WHERE `id` = ?", [id],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createTeam = async (req, res) => {

};

const updateTeam = async (req, res) => {

};

const deleteTeam = async (req, res) => {

};

module.exports = {
    getAllTeams,
    getTeamById,
    createTeam,
    updateTeam,
    deleteTeam
}
