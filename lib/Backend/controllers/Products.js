const { config } = require("../config/config");
const Product = require("../models/Product");
const path = require("path");

exports.getProducts = async (req, res, next) => {
  try {
    const products = await Product.find();
    res
      .status(200)
      .json({ success: true, length: products.length, data: products });
  } catch (error) {
    print(error.toString);
    res.status(400).json({ success: false, message: error.message });
  }
};

exports.getProduct = async (req, res, next) => {
  try {
    const product = await Product.findById(req.params.id);
    if (!product) {
      res.status(400).json({
        success: false,
        message: `product not found with ${req.params.id}`,
      });
    }

    res.status(200).json({ success: true, data: product });
  } catch (err) {
    let message;
    if (err.name === "CastError") {
      message = `Resource not found of id ${err.value}`;
    }
    res.status(400).json({ success: false, message: message });
  }
};

exports.createProduct = async (req, res, next) => {
  try {
    const product = await Product.create(req.body);

    res.status(201).json({
      success: true,
      data: product,
    });
  } catch (error) {
    let message;
    if (err.name === "CastError") {
      message = `Resource not found of id ${err.value}`;
    }

    //mongoose dup key
    if (err.code === 11000) {
      message = "Duplicate field entered";
    }

    if (err.name === "ValidationError") {
      message = Object.values(err.errors).map((val) => val.message);
    }
    res.status(400).json({ success: false, message: message });
  }
};

exports.updateProduct = async (req, res, next) => {
  try {
    const product = await Product.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    if (!product) {
      res.status(400).json({
        success: false,
        message: `product not found with ${req.params.id}`,
      });
    }

    res.status(200).json({ success: true, data: bootcamp });
  } catch (err) {
    let message;
    if (err.name === "CastError") {
      message = `Resource not found of id ${err.value}`;
    }

    //mongoose dup key
    if (err.code === 11000) {
      message = "Duplicate field entered";
    }

    if (err.name === "ValidationError") {
      message = Object.values(err.errors).map((val) => val.message);
    }
    res.status(400).json({ success: false, message: message });
  }
};

// @desc  Delete single Bootcamp
// @route DELETE /api/v1/bootcamps/:id

exports.deleteProduct = async (req, res, next) => {
  try {
    const product = await Bootcamp.findById(req.params.id);

    if (!product) {
      res.status(400).json({
        success: false,
        message: `product not found with ${req.params.id}`,
      });
    }

    product.remove();

    res.status(200).json({ success: true, data: {} });
  } catch (err) {
    let message;
    if (err.name === "CastError") {
      message = `Resource not found of id ${err.value}`;
    }

    res.status(400).json({ success: false, message: message });
  }
};

exports.productPhotoUpload = async (req, res, next) => {
  try {
    const product = await Product.findById(req.params.id);

    if (!product) {
      res.status(400).json({
        success: false,
        message: `product not found with ${req.params.id}`,
      });
    }

    if (!req.files) {
      res.status(400).json({
        success: false,
        message: `please upload file`,
      });
    }
    const file = req.files.file;

    //photo validation
    if (!file.mimetype.startsWith("image")) {
      res.status(400).json({
        success: false,
        message: `please upload image type`,
      });
    }
    if (file.size > process.env.MAX_FILE_UPLOAD) {
      res.status(400).json({
        success: false,
        message: `upload file size less than  ${config.MAX_FILE_UPLOAD}`,
      });
    }

    // create custom file name
    file.name = `photo_${product._id}${path.parse(file.name).ext}`;

    file.mv(`./public/uploads/${file.name}`, async (err) => {
      if (err) {
        console.log(er);
        res.status(500).json({
          success: false,
          message: `problem in uploading file`,
        });
      }

      await Product.findByIdAndUpdate(req.params.id, { image: file.name });
      res.status(200).json({ success: true, data: file.name });
    });
  } catch (err) {
    message = err.message;
    if (err.name === "CastError") {
      message = `Resource not found of id ${err.value}`;
    }

    res.status(400).json({ success: false, message: message });
  }
};
