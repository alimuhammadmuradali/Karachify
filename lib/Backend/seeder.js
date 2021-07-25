//input from file directly

const fs = require("fs");
const mongoose = require("mongoose");
const dotenv = require("dotenv");

// dotenv.config({ path: `./config/config.env` });

const Bootcamp = require("./models/Product");
const Product = require("./models/Product");

mongoose.connect(
  `mongodb+srv://Ali:ali1223@traveserymedia.m6ts8.mongodb.net/devCamper?retryWrites=true&w=majority`,
  {
    useNewUrlParser: true,
    useCreateIndex: true,
    useFindAndModify: false,
    useUnifiedTopology: true,
  }
);

//read json file
const products = JSON.parse(
  fs.readFileSync(`${__dirname}/_data/product.json`, "utf-8")
);

//import into DB
const importData = async () => {
  try {
    await Product.create(products);

    console.log("Data inported");
    process.exit();
  } catch (err) {
    console.error(err);
  }
};

//delete data
const deleteData = async () => {
  try {
    await Product.deleteMany();

    console.log("Data Destroyed");
    process.exit();
  } catch (err) {
    console.error(err);
  }
};

if (process.argv[2] === "-i") {
  importData();
} else if (process.argv[2] === "-d") {
  deleteData();
}
