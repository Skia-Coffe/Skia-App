const express = require('express');

const router = express.Router();
// Import the correct function names from the controller
const { getAllReviews, createReview } = require('../controllers/ReviewsController.js');

// Define your routes here
router.route('/:product').get(getAllReviews);
router.route('/addreview').post(createReview);

module.exports = router;
