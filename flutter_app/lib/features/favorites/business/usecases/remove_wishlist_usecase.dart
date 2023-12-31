import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/favorites/business/repositories/wishlist_repository.dart';

class RemoveWishlistUseCase implements UseCase<void, Map<String, dynamic>> {
  final WishlistRepository _wishlistRepository;
  RemoveWishlistUseCase(this._wishlistRepository);
  @override
  Future<void> call({Map<String, dynamic>? params}) {
    return _wishlistRepository.removeWishlist(
        params!['userID'], params['name']);
  }
}
