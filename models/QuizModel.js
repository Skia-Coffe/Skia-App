const mongoose = require("mongoose");

const quizSchema = new mongoose.Schema({
  question: {
    type: String,
    required: true,
    unique: true
  },
  option1: {
    type: String,
    required: true
  },
  option2: {
    type: String,
    required: true
  },
  option3: {
    type: String,
    required: true
  },
  option4: {
    type: String,
    required: true
  },

  quizId: {
    type: String,
    required: true,
    unique: true
  },

  
  quizInfo: {
    type: String
  }
});

const Quiz = mongoose.model("Quiz", quizSchema);

module.exports = Quiz;
