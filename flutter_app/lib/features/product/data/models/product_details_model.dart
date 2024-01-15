import 'package:skia_coffee/features/product/business/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel(
      {final String? id,
      final String? product,
      final String? dairyPreference,
      final int? cuppingScore,
      final String? sensory,
      final String? roast,
      final String? brewMethod,
      final int? price,
      final String? image,
      final String? quantity,
      final String? productInfo,
      final int? v})
      : super(
            id: id,
            dairyPreference: dairyPreference,
            product: product,
            roast: roast,
            brewMethod: brewMethod,
            price: price,
            quantity: quantity,
            productInfo: productInfo,
            image: image,
            cuppingScore: cuppingScore,
            sensory: sensory,
            v: v);

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['_id'],
      product: json['Product'],
      dairyPreference: json['Dairy_Preference'],
      cuppingScore: json['Cupping_Score'],
      sensory: json['Sensory'],
      roast: json['Roast'],
      brewMethod: json['Brew_Method'],
      price: json['price'],
      image: json['Image'],
      quantity: json['Quantity'],
      productInfo: json['Product_Info'],
      v: json['__v'],
    );
  }
}
