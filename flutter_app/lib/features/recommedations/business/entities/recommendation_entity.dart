import 'package:equatable/equatable.dart';

class RecommendationEntity extends Equatable {
  final String? name;
  final String? price;

  const RecommendationEntity({this.name, this.price});

  @override
  List<Object?> get props {
    return [name, price];
  }
}
