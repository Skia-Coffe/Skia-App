import 'package:equatable/equatable.dart';

class RequestEntity extends Equatable {
  String? flavour;
  String? roast;
  String? brewMethod;
  String? strong;
  String? additionalFlavour;
  String? UserID;
  RequestEntity({
    this.UserID,
    this.flavour,
    this.roast,
    this.brewMethod,
    this.strong,
    this.additionalFlavour,
  });

  @override
  List<Object?> get props {
    return [UserID, flavour, roast, brewMethod, strong, additionalFlavour];
  }

  Map<String, dynamic> toJson() {
    return {
      'UserID': UserID,
      'flavour': flavour,
      'roast': roast,
      'brew_method': brewMethod,
      'strong': strong,
      'additional_flavour': additionalFlavour,
    };
  }
}
