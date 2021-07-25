const mongoose = require("mongoose");

const ProductSchema = new mongoose.Schema({
  title: {
    type: String,
    required: [true, `Please add a title`],
    trim: true,
    maxlength: [50, "Title cannot be more than 50 characacters"],
  },

  description: {
    type: String,
    required: [true, `Please add a description`],
    unique: false,
    trim: true,
    maxlength: [500, "description cannot be more than 50 characacters"],
  },

  image: {
    type: String,
    default: "no-photo.jpg",
  },
  price: {
    type: Number,
    required: true,
  },

  createAt: {
    type: Date,
    default: Date.now,
  },
});

module.exports = mongoose.model("Product", ProductSchema);
