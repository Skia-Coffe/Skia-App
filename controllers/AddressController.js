const UserAddress = require("../models/AddressModel");

// getting all the addresses
const GetAllAddresses = async (req,res) =>{
    const {userID} = req.params;
    if(!userID){
        return res.status(400).json({msg:"Please enter all fields"});
    }
    const Addresses = await UserAddress.findOne({userID:userID});
    if(Addresses){
        return res.status(200).json(Addresses);
    }
    else{
        return res.status(400).json({msg:"No addresses found"});
    }
}

//creating a new address
const CreateAddress = async(req,res) => { 
    const {userID,Name,PhoneNumber,AddressHouseNo,Area,District,State,Pincode} = req.body;
    if(!userID || !Name || !PhoneNumber || !AddressHouseNo || !Area || !District || !State || !Pincode){
        return res.status(400).json({msg:"Please enter all fields"});
    }
    const NewAddress = await UserAddress.findOne({userID:userID});
    if(NewAddress){
        const newAddress = {
            Name,
            PhoneNumber,
            AddressHouseNo,
            Area,
            District,
            State,
            Pincode
        }
        NewAddress.Address.push(newAddress);
        await NewAddress.save();
        return res.status(201).json(NewAddress);
    }
    else{
        const newAddress = {
            userID,
            Address: [{
                Name,
                PhoneNumber,
                AddressHouseNo,
                Area,
                District,
                State,
                Pincode
            }]
        }
        const Address = await UserAddress.create(newAddress);
        return res.status(201).json(Address);
    }
}



 module.exports= {GetAllAddresses,CreateAddress};