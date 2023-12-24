// Import the necessary models
const UserWishlist = require("../models/UserWishlistmodel"); // Adjust the import path as needed

// Get all wishlist items for a specific user
const getAllWishlistItems = async (req, res) => {
  try {
    const userId = req.params.userId; // Assuming you pass the user ID as a parameter
    const wishlistItems = await UserWishlist.find({ userID: userId });
    res.status(200).json(wishlistItems);
  } catch (error) {
    console.error(error);
    res.status(500).json({ msg: "Internal server error" });
  }
};

// Create a new wishlist item for a specific user
const createWishlistItem = async (req, res) => {
  const { userID, product } = req.body;
  try {
    // Check if the user already exists
    let wishlistItem = await UserWishlist.findOne({ userID });

    if (wishlistItem) {
      // If the user exists, add the product to the wishlistItems array
      wishlistItem.wishlistItems.push({ product });
    } else {
      // If the user does not exist, create a new UserWishlist document
      wishlistItem = new UserWishlist({
        userID: userID,
        wishlistItems: [{ product: product }],
      });
    }

    await wishlistItem.save();

    res.status(201).json(wishlistItem);
  } catch (error) {
    console.error(error);
    res.status(500).json({ msg: "Internal server error" });
  }
};


const DeleteItem = async (req, res) => {
  const userId = req.params.userId;
  const name = req.params.name;
  if (!userId || !name) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }
  try {
    const wishlistItem = await UserWishlist.findOneAndUpdate(
      { userID: userId, "wishlistItems.product": name },
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
