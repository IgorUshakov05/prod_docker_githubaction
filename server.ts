require("dotenv").config();
import express, { Request, Response } from "express";

const app = express();

app.get("/", (req: Request, res: Response) => {
  res.status(200).json({ message: "Hello Linux" });
});

app.listen(3000, () => {
  console.log("Server start");
});
