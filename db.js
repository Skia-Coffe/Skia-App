const mongoose = require("mongoose");
require("dotenv").config();
const connectdb = async () => {
  const dburl =process.env.mongo_connection_string;
  try {
    const conn = await mongoose.connect(dburl, {
      useUnifiedTopology: true
    });

    console.log(`db connection established`);
  } catch (err) {
    console.log(err.message);
    process.exit();
  }
};

module.exports = connectdb;
