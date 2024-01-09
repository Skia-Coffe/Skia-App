import 'package:skia_coffee/features/home/business/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    final String? id,
    final String? product,
    final int? cuppingScore,
    final String? roast,
    final String? brewMethod,
    final double? price,
    final String? image,
    final String? quantity,
    final String? productInfo,
    final int? v,
    final String? sensory,
  }) : super(
          id: id,
          product: product,
          roast: roast,
          brewMethod: brewMethod,
          price: price,
          quantity: quantity,
          productInfo: productInfo,
          cuppingScore: cuppingScore,
          image: image,
          v: v,
          sensory: sensory,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      product: json['Product'],
      cuppingScore: json['Cupping_Score'],
      sensory: json['Sensory'],
      roast: json['Roast'],
      brewMethod: json['Brew_Method'],
      price: json['price'].toDouble(),
      image: json['Image'],
      quantity: json['Quantity'],
      productInfo: json['Product_Info'],
      v: json['__v'],
    );
  }
}
