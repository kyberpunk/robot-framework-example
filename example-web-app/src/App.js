import { useState } from "react";
import './App.css';

function App() {
  const [name, setName] = useState("");
  const [greeting, setGreeting] = useState("");

  const handleSubmit = (event) => {
    event.preventDefault();
    if (name !== "")
      setGreeting(`Hi ${name}!`);
    else
      setGreeting("");
  }

  return (
    <div>
      <form onSubmit={handleSubmit}>
        <label>Enter your name:{' '}
          <input 
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            id="name"
          />
        </label>
        <br/>
        <input type="submit" value="Greet me" id="submit" />
      </form>
      <h1 id="greeting">
        {greeting}
      </h1>
    </div>
  )
}

export default App;
