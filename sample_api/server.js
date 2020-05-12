'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

const users = {
  1: {
    id: "1",
    username: "Rushil Basappa",
  },
  2: {
    id: "2",
    username: "Dave Davids",
  },
};

var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
}

// App
const app = express();

app.use(allowCrossDomain);

app.get('/', (req, res) => {
  res.send(Object.values(users));
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
