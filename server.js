const express = require("express");
const app = express();
const cors = require("cors");
const port = 5000;
const UserRouter = require("./routes/UserRouter");
const OrderRouter = require("./routes/OrderRoutes");
const ProductRouter = require("./routes/ProductRouter");
const WishListRouter = require("./routes/WishListRouter");
const QuizRouter = require("./routes/QuizRouter");

const db = require("./db");
app.use(cors());

db();
app.use(express.json());

app.use("/user", UserRouter);
app.use("/order", OrderRouter);
app.use("/product", ProductRouter);
app.use("/wishlist/:user_id", WishListRouter);
app.use("/quiz" , QuizRouter);

app.use("/", (req , res) => {
  res.send("server is up and running");
});

app.listen(port, () => {
  console.log(`Server is running on port: ${port}`);
});
