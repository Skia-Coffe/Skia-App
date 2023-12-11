const quizModel = require("../models/QuizModel");
const Product = require("../models/ProductModel");
const UserQuizResponse = require("../models/UserAnswers");
const getAllQuiz = async (req, res) => {
  try {
    const quiz = await quizModel.find({});
    res.status(200).json(quiz);
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

const getRecommendations = async (req, res) => {
  try {
    const {
      flavour,
      roast,
      brew_method,
      strong,
      additional_flavour
    } = req.body;

    const products = await Product.find({
      flavour,
      roast,
      brew_method,
      strong,
      additional_flavour
    });
    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};
// saving the users responses
const SavingUsersResponses = async (req, res) => {
  try {
    const {
      UserID,
      flavour,
      roast,
      brew_method,
      strong,
      additional_flavour
    } = req.body;

    console.log("Request Body:", req.body); // Log the request body

    if (
      !UserID ||
      !flavour ||
      !roast ||
      !brew_method ||
      !strong ||
      !additional_flavour
    ) {
      return res.status(400).json({ msg: "Please enter all fields" });
    }

    const UsersAnswers = await UserQuizResponse.create({
      userID: UserID,
      flavour,
      roast,
      brew_method,
      strong,
      additional_flavour
    });

    console.log("UsersAnswers:", UsersAnswers); // Log the created document
    if (UsersAnswers) {
      res.status(200).json({
        userID: UsersAnswers.userID,
        flavour: UsersAnswers.flavour,
        roast: UsersAnswers.roast,
        brew_method: UsersAnswers.brew_method,
        strong: UsersAnswers.strong
      });
    }
  } catch (err) {
    console.error("Error saving user quiz response:", err);
    res.status(500).json({ msg: "Internal Server Error!" });
  }
};

// finding the users answers corresponding to a user ID and recommending it 
const SavedQuizResponse = async (req, res) => {
  const { userID } = req.params;
  console.log(userID);
  if (!userID) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

  try {
    const userExists = await UserQuizResponse.findOne({ userID });
    if (!userExists) {
      return res.status(404).json({ msg: "User not found" });
    }

    const { flavour, roast, brew_method, strong, additional_flavour } = userExists;
    const products = await Product.find({
      flavour,
      roast,
      brew_method,
      strong,
      additional_flavour
    });

    if (products && products.length > 0) {
      return res.status(200).json({ products });
    } else {
      return res.status(400).json({ msg: "No products found for the user" });
    }
  } catch (error) {
    console.log(error);
    return res.status(500).json({ msg: "Internal Server Error" });
  }
};

module.exports = {
  getAllQuiz,
  getRecommendations,
  SavingUsersResponses,
  SavedQuizResponse
};
