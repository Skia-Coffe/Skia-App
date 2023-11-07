const mongoose = require("mongoose");

const productSchema = new mongoose.Schema(
  {
    product: {
      type: String,
      required: true,
      unique: true
    },
    rating: {
      type: Number,
      required: true
    },
    flavour: {
      type: String,
      required: true
    },
    roast: {
      type: String,
      required: true
    },
    brew_method: {
      type: String,
      required: true
    },
    strong: {
      type: String,
      required: true
    },
    additional_flavour: {
      type: String,
      required: true
    },
    price: {
      type: Number,
      required: true
    },
    imageUrl: {
      type: String,
      required: true
    },
    quantity: {
      type: Number,
      required: true
    },
    productInfo: {
      type: String
    }
  },
  {
    timestamps: true
  }
);

productSchema.index({ product: 'text' });


const Product = mongoose.model("Product", productSchema);

module.exports = Product;

