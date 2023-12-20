const mongoose = require("mongoose");

const wishlistItemSchema = new mongoose.Schema({
  product: {
    type: String,
    required: true,
  },
});

const userWishlistSchema = new mongoose.Schema({
  userID:{
    type: String,
    required: true,
  },
  wishlistItems: [wishlistItemSchema],
});

const UserWishlist = mongoose.model("UserWishlist", userWishlistSchema);

module.exports = UserWishlist;
