import 'package:equatable/equatable.dart';

class AddWishlistEntity extends Equatable {
  final String? userID;
  final String? prod;
  const AddWishlistEntity({this.prod, this.userID});

  @override
  List<Object?> get props => [userID, prod];
  Map<String, dynamic> toJson() {
    return {'userID': userID, 'product': prod};
  }
}
