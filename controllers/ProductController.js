const ProductSchema = require("../models/ProductModel");

// getting all the products
const getAllProducts = async (req, res) => {
  try {
    const products = await ProductSchema.find({});
    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

// creating a new product
const createProduct = async (req, res) => {
  const {
    Product,
    Cupping_Score,
    Sensory,
    Roast,
    Brew_Method,
    price,
    Image,
    Quantity,
    Product_Info
  } = req.body;
  if (
    !Product ||
    !Cupping_Score ||
    !Sensory ||
    !Roast ||
    !Brew_Method ||
    !price ||
    !Image ||
    !Quantity ||
    !Product_Info
  ) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }
  try {
    const product = await ProductSchema.create({
      Product,
      Cupping_Score,
      Sensory,
      Roast,
      Brew_Method,
      price,
      Image,
      Quantity,
      Product_Info
    });
    res.status(201).json(product);
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};
// getting a product by name
const getProductByName = async (req, res) => {
  const { prod } = req.params;
  if (!prod) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

  const result = await ProductSchema.findOne({ Product: prod });
  if (result) {
    res.status(200).json({
      result
    });
  } else {
    res.send(404).json({ msg: "Product not found" });
  }
};

// search for a product on the basis of a query parameter
const ProductSearch = async (req, res) => {
  const query = req.query.search;
  console.log(query);
  if (!query) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

  try {
    const products = await ProductSchema.find({
      $text: { $search: query }
    });
    if (products) {
      res.status(200).json(products);
    } else {
      res.status(404).json({ msg: "Product not found" });
    }
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

module.exports = {
  getAllProducts,
  createProduct,
  getProductByName,
  ProductSearch
};
