const express = require("express");
const path = require("path");
const dotenv = require("dotenv");
const fileupload = require("express-fileupload");
const products = require("./routes/products.js");
const mongoose = require("mongoose");
const config = require("./config/config.js");

// dotenv.config({ path: "./config/config.env" });

mongoose
  .connect(config.MONGOURL, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useCreateIndex: true,
  })
  .then(() => {
    console.log("Connected to Database");
    app.listen(5000, () => {
      console.log("Server running");
    });
  })
  .catch((err) => console.error(err));

const app = express();

//body parser
app.use(express.json());

app.use(fileupload());

app.use(express.static(path.join(__dirname, "public")));

app.use("/api/products", products);
