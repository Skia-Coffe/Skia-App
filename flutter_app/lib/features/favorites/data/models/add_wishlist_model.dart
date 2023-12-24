import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';

class AddWishlistModel extends AddWishlistEntity {
  final String? userID;
  final String? prod;
  const AddWishlistModel({this.prod, this.userID})
      : super(userID: userID, prod: prod);

  Map<String, dynamic> toJson() {
    return {'userID': userID, 'product': prod};
  }
}
