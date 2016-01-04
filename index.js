'use strict';


var kraken = require('kraken-js'),
    app = {};


app.configure = function configure(nconf, next) {
    // Async method run on startup.
    next(null);
};


app.requestStart = function requestStart(server) {
    // Run before most express middleware has been registered.
};


app.requestBeforeRoute = function requestBeforeRoute(server) {
    // Run before any routes have been added.
};


app.requestAfterRoute = function requestAfterRoute(server) {
    // Run after all routes have been added.
};


if (require.main === module) {
    kraken.create(app).listen(process.env.VCAP_APP_PORT || 8000, function (err) {
        if (err) {
            console.error(err.stack);
        }
    });
}

//remove the following to disable tracking
require("cf-deployment-tracker-client").track();


module.exports = app;
