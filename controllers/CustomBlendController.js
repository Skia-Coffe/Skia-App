
const CustomBlend = require('../models/CustomBlendModel');
const UserModel = require('../models/UserModel');
const uuid = require('uuid');
const getCustomBlends = async (req, res) => {
    try {
        const customBlends = await CustomBlend.find({});
        res.status(200).json(customBlends);
    } catch (error) {
        res.status(500).json({ msg: 'Internal server error' });
    }
}

const createCustomBlend = async (req, res) => {
    const { user, blendName, blendInfo,blendFlavour,blendRoast } = req.body;
    if (!user || !blendName || !blendInfo || !blendFlavour || !blendRoast) {
        return res.status(400).json({ msg: 'Please enter all fields' });
    }
    const userExists = await UserModel.findOne({ _id: user });
    if (!userExists) {
        return res.status(400).json({ msg: 'User does not exist' });
    }
    const newCustomBlend = await CustomBlend.create({
        user,
        blendName,
        blendInfo,
        blendFlavour,
        blendRoast,
        blendId: "SkiaCustom-"+ uuid.v4()
        
    });
    res.status(201).json(newCustomBlend);
}

module.exports = { getCustomBlends , createCustomBlend};