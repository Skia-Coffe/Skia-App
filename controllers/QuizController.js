const quizModel = require("../models/QuizModel");
const productModel = require("../models/ProductModel");

const getAllQuiz = async (req, res) => {
  try {
    const quiz = await quizModel.find({});
    res.status(200).json(quiz);
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

const getRecommendations = async ( req, res ) => {
  try {
    const { flavour, roast, brew_method, strong, additional_flavour } =
      req.body;
    const products = await productModel.find({
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


module.exports = { getAllQuiz, getRecommendations };