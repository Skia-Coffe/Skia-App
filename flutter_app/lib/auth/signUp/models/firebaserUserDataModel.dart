class FirebaseUserModel {
  final String? userID;
  final String? name;
  final String? phoneNumber;

  FirebaseUserModel({
    required this.userID,
    required this.name,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
