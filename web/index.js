import React, { useState, useEffect } from "react";
import { render } from "react-dom";
require("dotenv").config();

const App = () => {
  const [users, setUsers] = useState([]);
  useEffect(() => {
    fetch(`http://${process.env.API_HOST}:${process.env.API_PORT}`)
      .then((res) => res.json())
      .then((data) => setUsers({ data }));
  }, []);
  return (
    <div>
      <div>
        <pre>{JSON.stringify(users, null, 2)}</pre>
      </div>
    </div>
  );
};

render(<App />, document.getElementById("root"));
