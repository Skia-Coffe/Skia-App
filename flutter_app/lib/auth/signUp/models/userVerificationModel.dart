class UserVerificationModel {
  final String? phoneNumber;

  UserVerificationModel({
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
    };
  }
}
