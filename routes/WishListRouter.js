const express = require("express");
const router = express.Router();
const wishlistController = require("../controllers/WishListController");

// Get all wishlist items for a specific user
router.get("/:userId", wishlistController.getAllWishlistItems);

// Create a new wishlist item for a specific user
router.post("/add", wishlistController.createWishlistItem);

// Delete a wishlist item for a specific user by product name
router.delete("/:userId/:name", wishlistController.DeleteItem);

module.exports = router;
