const mongoose = require("mongoose");

const UserQuizResponseSchema = new mongoose.Schema({
  userID: {
    type: String,
    required: true,
    unique: true
  },
  flavour:{
    type:String,
    required:true,
  },
  roast:{
    type:String,
    required:true
  },
  brew_method:{
    type:String,
    required:true
  },
  strong:{
    type:String,
    required:true
  },
  additional_flavour:{
    type:String,
    required:true
  },
});

const UserQuizResponse = mongoose.model(
  "UserQuizResponse",
  UserQuizResponseSchema
);

module.exports = UserQuizResponse;
