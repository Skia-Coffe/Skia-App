const mongoose = require("mongoose");

const CustomBlendSchema = new mongoose.Schema(
  {
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'user',
      required: true
    },
    blendId: {
      type: String,
      unique: true
    },
    blendName: {
      type: String,
    },

    blendInfo: {
      type: String,
      required: true,
      enum:["Arabica","Robusta","Chichory"],
      default:"Arabica"
    },

    blendFlavour: {
      type: String,
      required: true
    },
    blendRoast: {
      type: String,
      required: true
    },

    
  },
  {
    timestamps: true
  }
);

const CustomBlend = mongoose.model("CustomBlend", CustomBlendSchema);

module.exports = CustomBlend;
