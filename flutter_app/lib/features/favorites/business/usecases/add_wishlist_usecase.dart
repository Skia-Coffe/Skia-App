import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/favorites/business/entities/add_wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/business/repositories/add_wishlist_repository.dart';

class AddWishlistUseCase implements UseCase<void, AddWishlistEntity> {
  final AddWishlistRepository _addWishlistRepository;
  AddWishlistUseCase(this._addWishlistRepository);
  @override
  Future<void> call({AddWishlistEntity? params}) {
    return _addWishlistRepository.addWishlist(params!);
  }
}
