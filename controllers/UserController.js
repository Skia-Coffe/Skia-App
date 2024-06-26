const UserModel = require("../models/UserModel");

const createUser = async (req, res) => {
  const { name, phoneNumber, gender, dob, email } = req.body;
  if (!name || !phoneNumber || !gender || !dob || !email) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

  const UserExists = await UserModel.findOne({ phoneNumber, email });

  if (UserExists) {
    return res.status(400).json({ msg: "User already exists" });
  }
  const newUser = await UserModel.create({
    name,
    phoneNumber,
    gender,
    dob,
    email
  });

  if (newUser) {
    res.status(201).json({
      _id: newUser._id,
      name: newUser.name,
      phoneNumber: newUser.phoneNumber,
      gender: newUser.gender,
      dob: newUser.dob,
      email: newUser.email
    });
  }
};

//another api for custom user creation through firebase

const createUserFirebase = async (req, res) => {
  const { userID, name, phoneNumber } = req.body;
  if (!userID || !name || !phoneNumber) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

  const UserExists = await UserModel.findOne({ userID });
  if (UserExists) {
    return res.status(400).json({ msg: "User already exists" });
  }

  const newUser = await UserModel.create({
    userID,
    name,
    phoneNumber
  });

  if (newUser) {
    res.status(201).json({
      _id: newUser._id,
      UserId: newUser.userID,
      name: newUser.name,
      phoneNumber: newUser.phoneNumber
    });
  }
};

//search user by phone number from the parameter
const getUserByPhoneNumber = async (req, res) => {
  const { phoneNumber } = req.params;
  console.log(phoneNumber);
  if (!phoneNumber) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

 
  try{
    const UserExists = await UserModel.findOne({ phoneNumber });
    if (UserExists) {
      return res.status(200).json({
        _id: UserExists._id,
        UserId: UserExists.userID,
        name: UserExists.name,
        phoneNumber: UserExists.phoneNumber
      });

      
    }
    else{
      return res.status(404).json({ msg: "User not found" });
    }
  }
  catch(error){
    console.log(error);
  }


  
};

// searching user by phone number from the query parameter

const getUserByPhoneNumberQuery = async (req, res) => {
  const { phoneNumber } = req.query.search;
  console.log(phoneNumber);
  if (!phoneNumber) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

 
  try{
    const UserExists = await UserModel.findOne({ phoneNumber });
    if (UserExists) {
      return res.status(200).json({
        _id: UserExists._id,
        UserId: UserExists.userID,
        name: UserExists.name,
        phoneNumber: UserExists.phoneNumber
      });

      
    }
    else{
      return res.status(404).json({ msg: "User not found" });
    }
  }
  catch(error){
    console.log(error);
  }
}


module.exports = { createUser, createUserFirebase , getUserByPhoneNumber , getUserByPhoneNumberQuery};
