const express = require("express");
const app = express();
const cors = require("cors");
require("dotenv").config();
// this will allow us to use the .env file

const port = process.env.PORT ;
const UserRouter = require("./routes/UserRouter");
const OrderRouter = require("./routes/OrderRoutes");
const ProductRouter = require("./routes/ProductRouter");
const WishListRouter = require("./routes/WishListRouter");
const QuizRouter = require("./routes/QuizRouter");
const CustomBlendRouter = require("./routes/CustomBlenRouter");
const ReviewRouter = require("./routes/ReviewRouter");
const db = require("./db");
app.use(cors());

db();
app.use(express.json());

app.use("/user", UserRouter);
app.use("/order", OrderRouter);
app.use("/product", ProductRouter);
app.use("/wishlist", WishListRouter);
app.use("/quiz" , QuizRouter);
app.use("/customblend" , CustomBlendRouter);
app.use("/review", ReviewRouter);
app.use("/", (req , res) => {
  res.send("server is up and running");
});


app.listen(port, () => {
  console.log(`Server is running on port: ${port}`);
});
