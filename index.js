import express from "express";
import { configDotenv } from "dotenv";

configDotenv();

const PORT = process.env.PORT || 3000;

const app = express();
app.get("/", (req, res) => {
  res.send("Hello world from dockerized app!");
});
app.listen(PORT, () => console.log("Server running on port ", PORT));
