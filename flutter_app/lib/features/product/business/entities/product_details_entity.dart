import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  final String? id;
  final String? product;
  final String? dairyPreference;
  final int? cuppingScore;
  final String? sensory;
  final String? roast;
  final String? brewMethod;
  final int? price;
  final String? image;
  final String? quantity;
  final String? productInfo;
  final int? v;

  const ProductDetailsEntity({
    required this.dairyPreference,
    this.cuppingScore,
    this.sensory,
    this.image,
    this.v,
    required this.id,
    required this.product,
    required this.roast,
    required this.brewMethod,
    required this.price,
    required this.quantity,
    required this.productInfo,
  });

  @override
  List<Object?> get props {
    return [
      id,
      product,
      roast,
      brewMethod,
      price,
      quantity,
      productInfo,
      dairyPreference,
      cuppingScore,
      sensory,
      image,
      v,
    ];
  }
}
