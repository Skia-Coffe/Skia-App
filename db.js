const mongoose = require("mongoose");

const connectdb = async () => {
  const dburl =
    "mongodb+srv://shashankkrishu99:P2qcFJMA53vYR3sB@cluster0.i0mvqxh.mongodb.net/";
  try {
    const conn = await mongoose.connect(dburl, {
      useUnifiedTopology: true
    });

    console.log(`db connection established.... ${conn.connection.host}`);
  } catch (err) {
    console.log(err.message);
    process.exit();
  }
};

module.exports = connectdb;
