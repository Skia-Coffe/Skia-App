const ReviewSchema = require("../models/ReviewModel");
const UserModel = require("../models/UserModel");


// getting all the reviews for a product 
const getAllReviews = async (req, res) => {
    try {

        const product = req.params.product;
        const reviews = await ReviewSchema.find({ product });
        res.status(200).json(reviews);
    } catch (error) {
        res.status(500).json({ msg: "Internal server error" });
    }
}

// creating a new review    
const createReview = async (req, res) => {
    const { userID, product, review, rating } = req.body;
    if (!userID || !product || !review || !rating) {
        return res.status(400).json({ msg: "Please enter all fields" });
    }
    const userExists = await UserModel.findOne({ userID: userID });
    const userName = userExists.name;
    if (!userExists) {
        return res.status(400).json({ msg: "User does not exist" });
    }
    const newReview = await ReviewSchema.create({
        userName,
        product,
        review,
        rating
    });
    res.status(201).json(newReview);
}

module.exports = { getAllReviews, createReview };