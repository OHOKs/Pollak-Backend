const express = require('express')
var Router = express.Router()

const{
    getAllTeams,
    getTeamById,
    createTeam,
    updateTeam,
    deleteTeam
} = require('../controllers/teamController.js')

Router.get('/', getAllTeams);

Router.post('/', createTeam);

Router.get('/:id', getTeamById);

Router.delete('/:id', deleteTeam);

Router.put('/:id', updateTeam);

module.exports = Router