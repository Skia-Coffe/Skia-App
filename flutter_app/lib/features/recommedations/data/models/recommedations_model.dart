import 'package:skia_coffee/features/recommedations/business/entities/recommendation_entity.dart';

class RecommendationModel extends RecommendationEntity {
  const RecommendationModel({
    final String? name,
    final String? price,
  }) : super(name: name, price: price);

  factory RecommendationModel.fromJson(Map<String, dynamic> map) {
    return RecommendationModel(
      name: map['name'] ?? "Loading..",
      price: map['price'] ?? "Loaing..",
    );
  }
}
