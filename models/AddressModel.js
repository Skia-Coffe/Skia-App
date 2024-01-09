const mongoose = require('mongoose');

const AddressSchema = new mongoose.Schema({
    Name:{
        type: String,
        required: true,
    },

    PhoneNumber:{
        type: String,
        required: true,
    },
    AddressHouseNo:{
        type: String,
        
    },

    Area:{
        type: String,
        required: true,
    },

    District:{
        type: String,
        required: true,
    },
    State:{
        type: String,
        required: true,
    },
    Pincode:{
        type: String,
        required: true,
    },
    
   
});


const UserAddresses = new mongoose.Schema({
    userID:{
        type: String,
        required: true,
    },
    Address: [AddressSchema],
});

const UserAddress = mongoose.model("UserAddress", UserAddresses);
module.exports = UserAddress;