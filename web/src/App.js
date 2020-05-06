import React, { useEffect, useState } from "react";
import "./App.css";
import axios from "axios";

const USERS_SERVICE_URL = process.env.REACT_APP_USERS_SERVICE_URL;

function App() {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    console.log(USERS_SERVICE_URL);
    async function fetchData() {
      const options = {
        url: `${USERS_SERVICE_URL}/users`,
        method: "get",
        headers: {
          "Content-Type": "application/json",
        },
      };
      await axios(options).then((res) => setUsers(res.data));
    }
    fetchData();
  }, []);

  return (
    <div>
      <header className="App-header">
        <div>
          <pre>{JSON.stringify(users, null, 2)}</pre>
        </div>
      </header>
    </div>
  );
}

export default App;
