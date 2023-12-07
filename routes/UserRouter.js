const express = require("express");

const router = express.Router();

const { createUser , createUserFirebase} = require("../controllers/UserController");

router.route("/").post(createUser);
router.route("/firebasecreate").post(createUserFirebase);
module.exports = router;
