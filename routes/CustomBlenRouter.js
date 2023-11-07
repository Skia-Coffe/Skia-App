const express = require("express");

const router = express.Router();
   
const {getCustomBlends,createCustomBlend} = require("../controllers/CustomBlendController");



router.route('/').get(getCustomBlends);
router.route('/create').post(createCustomBlend);

module.exports = router;