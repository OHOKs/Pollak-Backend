const express = require('express')
var Router = express.Router()

const{
    getDataForBrackets
} = require('../controllers/mixedController.js')

Router.get('/', getDataForBrackets);

module.exports = Router