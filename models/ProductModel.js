const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  Product: {
    type: String,
    required: true,
  
  },
  Dairy_Preference: {
    type: String,
    required: true,
  },
  rating: {
    type: Number,
  },
  Cupping_Score:{
    type: Number,
    required: true,
  },
  Sensory:{
    type: String,
    required: true,
  },
  Roast:{
    type: String,
    required: true,
  },
  Brew_Method:{
    type: String,
    required: true,
  },
  price:{
    type: Number,
    required: true,
  },
  Image:{
    type: String,
    required: true,
  },
  Quantity:{
    type: String,
    required: true,
    enum: ["250g", "500g", "750g", "1kg"]

  },
  Product_Info:{
    type: String,
    required: true,
  },
  
});

productSchema.index({ product: "text" });

const Product = mongoose.model("Product", productSchema);

module.exports = Product;
