const express = require('express');

const router = express.Router();

const {GetAllAddresses,CreateAddress} = require('../controllers/AddressController');

router.route('/:userID').get(GetAllAddresses);
router.route('/NewAddress').post(CreateAddress);

module.exports = router;