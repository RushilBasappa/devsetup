'use strict';

const express = require('express');
const morgan = require('morgan')

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
    username: "Goutham Pilla",
  },
  3: {
    id: "3",
    username: "Ravi Bhim"
  },
  4: {
    id: "4",
    username: "Ravi Bhim"
  }
};

var allowCrossDomain = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', "*");
    next();
}

// App
const app = express();

app.use(allowCrossDomain);
app.use(morgan('tiny'))

app.get('/', (req, res) => {
  res.send(Object.values(users));
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
