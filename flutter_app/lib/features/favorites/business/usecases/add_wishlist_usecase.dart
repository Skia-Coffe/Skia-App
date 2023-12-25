import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/business/repositories/wishlist_repository.dart';

class AddWishlistUseCase implements UseCase<void, AddWishlistEntity> {
  final WishlistRepository _wishlistRepository;
  AddWishlistUseCase(this._wishlistRepository);
  @override
  Future<void> call({AddWishlistEntity? params}) {
    return _wishlistRepository.addWishlist(params!);
  }
}
