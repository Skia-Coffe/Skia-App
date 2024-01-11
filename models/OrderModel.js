const mongoose = require("mongoose");

const orderSchema = new mongoose.Schema({
  orderID: {
    type: String,
    unique: true
  },

  product: {
    type: String,
    required: true
  },
  quantity: {
    type: Number,
    required: true
  },
  Price:{
    type: Number,
    required: true
  },

  status: {
    type: String,
    enum: ["pending", "confirmed", "shipped", "delivered", "canceled"],
    default: "pending"
  },
  orderDate: {
    type: Date,
    default: Date.now
  },
  deliveryAddress: {
    type: String,
    required: true
  },
  // contact number
  deliveryNumber: {
    type: Number
  }
});
const userOrderSchema = new mongoose.Schema({
  userID: {
    type: String,
    required: true
  },
  orders: [orderSchema]
});
const Order = mongoose.model("Order",userOrderSchema);

module.exports = Order;
