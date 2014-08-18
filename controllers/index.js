'use strict';


var IndexModel = require('../models/index');


module.exports = function (app) {

    var model = new IndexModel();


    app.get('/', function (req, res) {
        
        res.render('index', model);
        
    });

    app.get('/time', function (req, res) {
        var json = {message: "Whattup", date: new Date()};
        console.log(json);
        res.json(json);
        
    });

};
