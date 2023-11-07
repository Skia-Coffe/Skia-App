const mongoose = require("mongoose");

const orderSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "user",
    required: true
  },
  orderID: {
    type: String,
    required: true,
    unique: true
  },

  products: [
    {
      product: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Product",
        required: true
      },
      quantity: {
        type: Number,
        required: true
      }
    }
  ],

  status: {
    type: String,
    enum: ["pending", "confirmed", "shipped", "delivered", "canceled"],
    default: "pending"
  },
  orderDate: {
    type: Date,
    default: Date.now
  },
  deliveryAddress:{
    type: String,
    required: true
  },
  // contact number
  deliveryNumber:{
    type: Number,
    required: true
  },
  
  
});

const Order = mongoose.model("Order", orderSchema);

module.exports = Order;
