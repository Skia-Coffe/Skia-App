const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },

  phoneNumber: {
    type: String,
    unique: true,
    required: true
  },
  gender: {
    type: String,
    enum: ["Male", "Female", "Other"]
  },
  dob: {
    type: Date,
    required: true
  },
  email: {
    type: String,
    required: true,
    unique: true,
    lowercase: true
  },
  userId: {
    type: String,
    unique: true
  }
});

const user = mongoose.model("user", UserSchema);

module.exports = user;
