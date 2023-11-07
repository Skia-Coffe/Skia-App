const mongoose = require('mongoose');

const wishlistItemSchema = new mongoose.Schema({
  product: {
    type: String,
    required: true,
  },
});

const userWishlistSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'user', // Reference to the User model
    required: true,
  },
  wishlistItems: [wishlistItemSchema],
});

const UserWishlist = mongoose.model('UserWishlist', userWishlistSchema);

module.exports = UserWishlist;
