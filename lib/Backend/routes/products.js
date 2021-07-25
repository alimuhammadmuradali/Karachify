const express = require("express");
const {
  getProducts,
  getProduct,
  updateProduct,
  deleteProduct,
  createProduct,
  productPhotoUpload,
} = require("../controllers/Products");

const router = express.Router();

router.route("/").get(getProducts).post(createProduct);

router.route("/:id/photo").put(productPhotoUpload);

router.route("/:id").get(getProduct).put(updateProduct).delete(deleteProduct);

module.exports = router;
