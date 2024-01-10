

const UserModel = require('../models/UserModel');
const UserCustomBlend = require('../models/CustomBlendModel');
const uuid = require('uuid');

// getting all custom blends of the user
const getCustomBlends = async (req, res) => {
    const { UserId } = req.params;
    if (!UserId) {
        return res.status(400).json({ msg: 'Please enter all fields' });
    }
    try {
        const CustomBlends = await UserCustomBlend.findOne({ userID: UserId });
        if (CustomBlends) {
            return res.status(200).json(CustomBlends);
        }
        else {
            return res.status(400).json({ msg: 'No custom blends found' });
        }
    } catch (error) {
        res.status(500).json({ msg: 'Internal server error' });
    }
}


// creating a new custom blend of the user
const createCustomBlend = async (req, res) => {
    const { userID, blendName, beanInfo, blendFlavour, blendRoast } = req.body;
    if (!userID || !blendName || !beanInfo || !blendFlavour || !blendRoast) {
        return res.status(400).json({ msg: 'Please enter all fields' });
    }
    try {
        const user = await UserCustomBlend.findOne({ userID: userID });
        if (user) {
            const newCustomBlend = {
                blendId:"SkiaCustom" +  uuid.v4(),
                blendName,
                beanInfo,
                blendFlavour,
                blendRoast
            }
            user.CustomBlendItems.push(newCustomBlend);
            await user.save();
            return res.status(201).json(user);
        }
        else {
            const newCustomBlend = {
                userID,
                CustomBlendItems: [{
                    blendId: "SkiaCustom-"+ uuid.v4(),
                    blendName,
                    beanInfo,
                    blendFlavour,
                    blendRoast
                }]
            }
            const CustomBlend = await UserCustomBlend.create(newCustomBlend);
            return res.status(201).json(CustomBlend);
        }
    } catch (error) {
        res.status(500).json({ msg: 'Internal server error' });
    }
}

module.exports = { getCustomBlends , createCustomBlend};