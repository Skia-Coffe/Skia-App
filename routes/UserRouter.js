const express = require("express");

const router = express.Router();

const { createUser , createUserFirebase,getUserByPhoneNumber} = require("../controllers/UserController");

router.route("/").post(createUser);
router.route("/firebasecreate").post(createUserFirebase);
router.route("/getuser").get(getUserByPhoneNumber);
module.exports = router;
