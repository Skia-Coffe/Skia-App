import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? id;
  final String? product;
  final int? cuppingScore;
  final String? sensory;
  final String? roast;
  final String? brewMethod;
  final double? price;
  final String? image;
  final String? quantity;
  final String? productInfo;
  final int? v;

  const ProductEntity({
    required this.id,
    required this.product,
    required this.cuppingScore,
    required this.sensory,
    required this.roast,
    required this.brewMethod,
    required this.price,
    required this.image,
    required this.quantity,
    required this.productInfo,
    required this.v,
  });

  @override
  List<Object?> get props {
    return [
      id,
      product,
      roast,
      brewMethod,
      price,
      productInfo,
      cuppingScore,
      v,
      image,
      sensory,
      quantity
    ];
  }
}
