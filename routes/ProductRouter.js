
const express = require('express');

const router = express.Router();

const { getAllProducts , createProduct , getProductByName , ProductSearch} = require('../controllers/ProductController');
router.route("/").get(getAllProducts);
router.route("/newproduct").post(createProduct);
router.route("/search").get(ProductSearch);
router.route("/:prod").get(getProductByName);



module.exports = router;