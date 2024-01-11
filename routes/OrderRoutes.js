const express = require("express");

const router = express.Router();

const {
  GetAllOrders,
  CreateOrder,
  UpdateOrderStatus,
  DeleteOrder
} = require("../controllers/OrderController");

router.route("/:userID").get(GetAllOrders);
router.route("/create").post(CreateOrder);
router.route("/update").post(UpdateOrderStatus);
router.route("/delete").post(DeleteOrder);


module.exports = router;
