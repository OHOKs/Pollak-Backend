const connect = require("../config/db");

const getAllUsers = async (req, res) => {
    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `users`", (err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const getUserById = async (req, res) => {

    const id = req.params.id; 

    try{
        const users = await new Promise((resolve, reject) => {
            connect.query("SELECT * FROM `users` WHERE `id` = ?", [id],(err, result) => {
                if (err) reject(err); 
                else resolve(result);
            });
        });

        return res.json(users);
    } catch (error){ res.status(500).json(error); }
};

const createUser = async (req, res) => {

};

const updateUser = async (req, res) => {

};

const deleteUser = async (req, res) => {

};

module.exports = {
    getAllUsers,
    getUserById,
    createUser,
    updateUser,
    deleteUser
}
