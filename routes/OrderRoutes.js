const express = require("express");

const router = express.Router();

const {
  createOrder,
  getOrderByID,
  changeOrderStatus,
  getAllOrders,
  
} = require("../controllers/OrderController");

router.route("/").get(getAllOrders);
router.route("/neworder").post(createOrder);
router.route("/:name").get(getOrderByID);
router.route("/:orderID").patch(changeOrderStatus);


module.exports = router;
