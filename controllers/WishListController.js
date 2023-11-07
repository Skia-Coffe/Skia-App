// Import the necessary models
const UserWishlist = require("../models/UserWishlistmodel"); // Adjust the import path as needed

// Get all wishlist items
const getAllWishlistItems = async (req, res) => {
  try {
    const wishlistItems = await UserWishlist.find({});
    // Use the UserWishlist model
    res.status(200).json(wishlistItems);
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

// Create a new wishlist item
const createWishlistItem = async (req, res) => {
  const { user, product } = req.body;
  try {
    const wishlistItem = new UserWishlist({
      user: user,
      wishlistItems: [{ product: product }]
    });

    await wishlistItem.save();

    res.status(201).json(wishlistItem);
  } catch (error) {
    console.error(error);
    // Log the error for debugging.
    res.status(500).json({ msg: "Internal server error" });
  }
};

const DeleteItem = async (req, res) => {
  const name = req.params.name;
  if (!name) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }
  try {
    // Ensure that userWishlistId and name are correct and exist in the database
    const wishlistItem = await UserWishlist.findOneAndUpdate(
      { "wishlistItems.product": name }, // Match the user and the product name
      { $pull: { wishlistItems: { product: name } } },
      { new: true }
    );

    if (wishlistItem) {
      res.status(200).json({ msg: "Item deleted" });
    } else {
      res.status(404).json({ msg: "Item not found" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ msg: "Internal server error" });
  }
};

// Export the controller functions
module.exports = { getAllWishlistItems, createWishlistItem, DeleteItem };
