import 'package:logger/logger.dart';
import 'package:skia_coffee/core/resources/data_state.dart';
import 'package:skia_coffee/core/usecases/usecase.dart';
import 'package:skia_coffee/features/favorites/business/entities/wishlist_entity.dart';
import 'package:skia_coffee/features/favorites/business/repositories/wishlist_repository.dart';

class GetWishlistUseCase
    implements UseCase<DataState<List<WishlistEntity>>, String> {
  final WishlistRepository _wishlistRepository;
  GetWishlistUseCase(this._wishlistRepository);

  Logger log = Logger();
  @override
  Future<DataState<List<WishlistEntity>>> call({String? params}) {
    log.i(params);
    return _wishlistRepository.getWishlist(params!);
  }
}
