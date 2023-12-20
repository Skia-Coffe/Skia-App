import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
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

  ProductDetailsEntity({
    required this.id,
    required this.product,
    required this.rating,
    required this.flavour,
    required this.roast,
    required this.brewMethod,
    required this.strong,
    required this.additionalFlavour,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.productInfo,
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
    ];
  }
}
