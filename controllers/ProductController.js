const ProductSchema = require("../models/ProductModel");

// getting all the products
const getAllProducts = async ( req , res ) => {
  try {
    const products = await ProductSchema.find({});
    res.status(200).json(products);
  } catch (error) {
    res.status(500).json({ msg: "Internal server error" });
  }
};

// creating a new product
const createProduct = async (req, res) => {
  const {
    product,
    rating,
    flavour,
    roast,
    brew_method,
    strong,
    additional_flavour,
    price,
    imageUrl,
    quantity,
    productInfo
  } = req.body;

  if (
    !product ||
    !rating ||
    !flavour ||
    !roast ||
    !brew_method ||
    !strong ||
    !additional_flavour ||
    !price ||
    !imageUrl ||
    !quantity ||
    !productInfo
  ) {
    return res.status(400).json({ msg: "Please enter all fields" });
  }

  const productExists = await ProductSchema.findOne({ product });

  if (productExists) {
    return res.status(400).json({ msg: "Product already exists" });
  }

  const newProduct = await ProductSchema.create({
    product,
    rating,
    flavour,
    roast,
    brew_method,
    strong,
    additional_flavour,
    price,
    imageUrl,
    quantity,
    productInfo
  });

  if (newProduct) {
    res.status(201).json({
      _id: newProduct._id,
      product: newProduct.product,
      rating: newProduct.rating,
      flavour: newProduct.flavour,
      roast: newProduct.roast,
      brew_method: newProduct.brew_method,
      strong: newProduct.strong,
      additional_flavour: newProduct.additional_flavour,
      price: newProduct.price,
      imageUrl: newProduct.imageUrl,
      quantity: newProduct.quantity,
      productInfo: newProduct.productInfo,
      createdAt: newProduct.createdAt,
      updatedAt: newProduct.updatedAt
    });
  }
};

// getting a product by name
const getProductByName = async(req,res) => {
    const { prod } = req.params;
    if(!prod){
        return res.status(400).json({msg: "Please enter all fields"});
    }

    const result = await ProductSchema.findOne({product: prod});
    if(result) {
        res.status(200).json({
            _id: result._id,
            product: result.product,
            rating: result.rating,
            flavour: result.flavour,
            roast: result.roast,
            brew_method: result.brew_method,
            strong: result.strong,
            additional_flavour: result.additional_flavour,
            price: result.price,
            imageUrl: result.imageUrl,
            quantity: result.quantity,
            productInfo: result.productInfo,
           
        });
    }
    else{
        res.send(404)
    }
}

// search for a product on the basis of a query parameter
const ProductSearch = async (req, res) => {
    const  query  = req.query.search;
    console.log(query);
    if (!query) {
        return res.status(400).json({ msg: "Please enter all fields" });
    }

    
    try {
        const products = await ProductSchema.find({
        $text: { $search: query }
        });
        if (products) {
        res.status(200).json(products);
        } else {
        res.status(404).json({ msg: "Product not found" });
        }
    } catch (error) {
        res.status(500).json({ msg: "Internal server error" });
    }
    }



module.exports = { getAllProducts, createProduct, getProductByName, ProductSearch };
