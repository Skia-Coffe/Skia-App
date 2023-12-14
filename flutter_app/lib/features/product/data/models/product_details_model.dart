import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    final String? id,
    final String? product,
    final double? rating,
    final String? flavour,
    final String? roast,
    final String? brewMethod,
    final String? strong,
    final String? additionalFlavour,
    final double? price,
    final String? imageUrl,
    final int? quantity,
    final String? productInfo,
  }) : super(
            id: id,
            product: product,
            rating: rating,
            flavour: flavour,
            roast: roast,
            brewMethod: brewMethod,
            strong: strong,
            additionalFlavour: additionalFlavour,
            price: price,
            imageUrl: imageUrl,
            quantity: quantity,
            productInfo: productInfo);

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['_id'],
      product: json['product'],
      rating: json['rating'].toDouble(),
      flavour: json['flavour'],
      roast: json['roast'],
      brewMethod: json['brew_method'],
      strong: json['strong'],
      additionalFlavour: json['additional_flavour'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
      productInfo: json['productInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'product': product,
      'rating': rating,
      'flavour': flavour,
      'roast': roast,
      'brew_method': brewMethod,
      'strong': strong,
      'additional_flavour': additionalFlavour,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'productInfo': productInfo,
    };
  }
}
