import 'package:skia_coffee/features/recommedations/business/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({
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
    final String? createdAt,
    final String? updatedAt,
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
            productInfo: productInfo,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
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
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
