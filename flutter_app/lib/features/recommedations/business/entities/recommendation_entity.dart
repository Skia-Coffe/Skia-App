import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final String? id;
  final String? product;
  final double? rating;
  final String? flavour;
  final String? roast;
  final String? brewMethod;
  final String? strong;
  final String? additionalFlavour;
  final double? price;
  final String? imageUrl;
  final int? quantity;
  final String? productInfo;
  final String? createdAt;
  final String? updatedAt;

  const RecommendationEntity({
    this.id,
    this.product,
    this.rating,
    this.flavour,
    this.roast,
    this.brewMethod,
    this.strong,
    this.additionalFlavour,
    this.price,
    this.imageUrl,
    this.quantity,
    this.productInfo,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      product,
      rating,
      flavour,
      roast,
      brewMethod,
      strong,
      additionalFlavour,
      price,
      imageUrl,
      quantity,
      productInfo,
      createdAt,
      updatedAt,
    ];
  }
}
