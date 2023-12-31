const mongoose = require("mongoose");

const ReviewSchema = new mongoose.Schema({
  userName: {
    type: String,
    required: true
  },
  product: {
    type: String,
    required: true
  },
  comments: {
    type: String,
  },

  review: {
    type: String,
    required: true
  },
  rating: {
    type: Number,
    required: true
  }
});

const reviews = mongoose.model("reviews", ReviewSchema);

module.exports = reviews;
