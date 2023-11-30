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

  Map<String, dynamic> toJson() {
    return {
      'flavour': flavour,
      'roast': roast,
      'brew_method': brewMethod,
      'strong': strong,
      'additional_flavour': additionalFlavour,
    };
  }
}
