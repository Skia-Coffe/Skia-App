
const express = require("express");

const router = express.Router();
const {getAllQuiz , getRecommendations} = require("../controllers/QuizController");

router.route('/').get(getAllQuiz);

router.route('/recommendations').get(getRecommendations);
module.exports = router;