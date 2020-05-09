'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

const users = {
  1: {
    id: "1",
    username: "Robin Wieruch",
  },
  2: {
    id: "2",
    username: "Dave Davids",
  },
};

// App
const app = express();
app.get('/users', (req, res) => {
  res.send(Object.values(users));
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);