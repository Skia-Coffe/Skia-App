import 'package:equatable/equatable.dart';

class RequestEntity extends Equatable {
  String? flavour;
  String? roast;
  String? brewMethod;
  bool? strong;
  String? additionalFlavour;
  RequestEntity({
    this.flavour,
    this.roast,
    this.brewMethod,
    this.strong,
    this.additionalFlavour,
  });

  @override
  List<Object?> get props {
    return [flavour, roast, brewMethod, strong, additionalFlavour];
  }
}
