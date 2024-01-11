const OrderSchema = require("../models/OrderModel");
const { v4: uuidv4 } = require("uuid");
const ProductSchema = require("../models/ProductModel"); // Importing the Product Schema
// Importing the UUID v4 generator

// Getting all orders of the user
const GetAllOrders = async (req, res) => {
  const { userID } = req.params;
  if (!userID) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }
  try {
    const user = await OrderSchema.findOne({ userID: userID });
    if (user) {
      return res.status(200).json(user);
    } else {
      return res.status(400).json({ msg: "No orders found" });
    }
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

// Creating a new order of the user
const CreateOrder = async (req, res) => {
  const {userID,product,quantity,status,deliveryAddress} = req.body;
  if(!userID || !product || !quantity ||   !status || !deliveryAddress){
    return res.status(400).json({msg:"Please enter all fields"});
  }

  const exists = await OrderSchema.findOne({userID:userID});
  const cost = await ProductSchema.findOne({Product:product});
  if(exists){
    const newOrder = {
      orderID:"SkiaOrder" + uuidv4(),
      product,
      quantity,
      Price : cost.price * quantity,
      status,
      deliveryAddress
    }
    exists.orders.push(newOrder);
    await exists.save();
    return res.status(201).json(exists);
  }
  else{
    const newOrder = {
      userID,
      orders: [
        {
          orderID: "SkiaOrder" + uuidv4(),
          product,
          quantity,
          Price: cost.price * quantity,
          status,
          deliveryAddress

        },
      ],
    };
    const order = await OrderSchema.create(newOrder);
    return res.status(201).json(order);

  }
};

// Updating the order status
const UpdateOrderStatus = async (req, res) => {
  const { userID, orderID, status } = req.body;
  if (!userID || !orderID || !status) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }
  try {
    const user = await OrderSchema.findOne({ userID: userID });
    if (user) {
      const order = user.orders.find((order) => order.orderID === orderID);
      if (order) {
        order.status = status;
        await user.save();
        return res.status(201).json(user);
      } else {
        return res.status(400).json({ msg: "No order found" });
      }
    } else {
      return res.status(400).json({ msg: "No user found" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ msg: "Internal server error" });
  }
};

// Deleting an order
const DeleteOrder = async (req, res) => {
  const { userID, orderID } = req.body;
  if (!userID || !orderID) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }
  try {
    const user = await OrderSchema.findOne({ userID: userID });
    if (user) {
      if (user.orders && user.orders.length > 0) {
        const orderIndex = user.orders.findIndex((order) => order.orderID == orderID);
        if (orderIndex !== -1) {
          user.orders.splice(orderIndex, 1);
          await user.save();
          return res.status(200).json(user);
        } else {
          return res.status(400).json({ msg: "No order found" });
        }
      } else {
        return res.status(400).json({ msg: "No orders found for the user" });
      }
    } else {
      return res.status(400).json({ msg: "No user found" });
    }
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};


module.exports = {
  GetAllOrders,
  CreateOrder,
  UpdateOrderStatus,
  DeleteOrder,
};