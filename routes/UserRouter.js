const express = require("express");

const router = express.Router();

const { createUser , createUserFirebase , getUserByPhoneNumber,getUserByPhoneNumberQuery} = require("../controllers/UserController");

router.route("/").post(createUser);
router.route("/:phoneNumber").get(getUserByPhoneNumber);
router.route("/query/:phoneNumber").get(getUserByPhoneNumberQuery);
router.route("/firebasecreate").post(createUserFirebase);

module.exports = router;
