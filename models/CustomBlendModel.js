const mongoose = require("mongoose");

// Define the CustomBlendSchema
const CustomBlendSchema = new mongoose.Schema({
  blendId: {
    type: String,
    unique: true,
  },
  blendName: {
    type: String,
    required: true,
  },
  beanInfo: {
    type: String,
    required: true,
  },
  blendFlavour: {
    type: String,
    required: true,
  },
  blendRoast: {
    type: String,
    required: true,
  },
});

// Define the UserCustomBlendSchema using CustomBlendSchema
const UserCustomBlendSchema = new mongoose.Schema({
  userID: {
    type: String,
    required: true,
  },
  CustomBlendItems: [CustomBlendSchema], // Use CustomBlendSchema here
});

// Create the model for UserCustomBlend using UserCustomBlendSchema
const UserCustomBlend = mongoose.model("UserCustomBlend", UserCustomBlendSchema);

// Export the model
module.exports = UserCustomBlend;
