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

// App
const app = express();
app.use(cors())

app.get('/', (req, res) => {
  res.send(Object.values(users));
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
