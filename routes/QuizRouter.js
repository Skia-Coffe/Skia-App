
const express = require("express");

const router = express.Router();
const {getAllQuiz , getRecommendations,SavingUsersResponses,SavedQuizResponse,} = require("../controllers/QuizController");

router.route('/').get(getAllQuiz);
router.route('/recommendations').get(getRecommendations);
router.route("/save").post(SavingUsersResponses);
router.route("/:userID").get(SavedQuizResponse);
module.exports = router;