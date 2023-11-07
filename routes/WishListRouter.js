const express = require("express");

const router = express.Router();
const {
  getAllWishlistItems,
  createWishlistItem,
  DeleteItem
} = require("../controllers/WishListController");
router.route("/").get(getAllWishlistItems);
router.route("/newitem").post(createWishlistItem);
router.delete("/:name", DeleteItem);

module.exports = router;
