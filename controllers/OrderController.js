const OrderSchema = require("../models/OrderModel");
const { v4: uuidv4 } = require("uuid");
// Importing the UUID v4 generator

const createOrder = async (req, res) => {
  const { user, products } = req.body;

  if (!user || !products) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }
  const orderID = "Skia-" + uuidv4(); // Generate a UUID v4
  const newOrder = await OrderSchema.create({ orderID, user, products });

  if (newOrder) {
    res.status(201).json({
      orderid: orderID,
      user: newOrder.user,
      products: newOrder.products,
      status: newOrder.status,
      orderDate: newOrder.orderDate
    });
  } else {
    res.status(400).json({ msg: "Order not created" });
  }
};

const getOrderByID = async (req, res) => {
  const { name } = req.params;
  if (!name) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

  try {
    const order = await OrderSchema.findOne({
      $or: [{ orderID: name }, { name: name }]
    });
    if (order) {
      res.status(200).json({
        orderId: order.orderID,
        user: order.user,
        products: order.products,
        status: order.status,
        orderDate: order.orderDate
      });
    } else {
      res.status(404).json({ msg: "Order not found" });
    }
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

// function to change the order status
const changeOrderStatus = async (req, res) => {
  const { status } = req.body;
  const { orderID } = req.params;
  if (!status || !orderID) {
    return res
      .status(400)
      .json({ msg: "Please give an proper input for status and orderID" });
  }

  try {
    const order = await OrderSchema.findOne({ orderID: orderID });
    if (order) {
      order.status = status;
      const updatedOrder = await order.save();
      res.status(200).json({
        orderId: updatedOrder.orderID,
        user: updatedOrder.user,
        products: updatedOrder.products,
        status: updatedOrder.status,
        orderDate: updatedOrder.orderDate
      });
    } else {
      res.status(404).json({ msg: "Order not found" });
    }
  } catch (err) {
    res.status(404).send(err.message);
  }
};

// getting all the orders
const getAllOrders = async (req, res) => {
  try {
    const orders = await OrderSchema.find({});
    res.status(200).json(orders);
  } catch (err) {
    res.status(404).send(err.message);
  }
};

module.exports = {
  createOrder,
  getOrderByID,
  changeOrderStatus,
  getAllOrders
};
