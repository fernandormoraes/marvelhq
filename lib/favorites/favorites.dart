import 'package:marvelhq/models/comic.dart';
import 'favoriteStorage.dart';

class Favorites {

  FavoritesStorage storage = FavoritesStorage();
  List favorites = [];

  Future readAllFavorites() async {
    favorites = await storage.readFavorites();
    return favorites;
  }

  Future addFavorite(Comic comic) async {
    if (!favorites.any((p) => p.id == comic.id)) {
      favorites.add(comic);

      await storage.writeFavorites(favorites);
    }
  }

  Future removeFavorite(Comic comic) async {
    favorites.removeWhere((p) => p.id == comic.id);

    await storage.writeFavorites(favorites);
  }

  bool isFavorite(Comic comic) {
    return favorites.any((p) => p.id == comic.id);
  }
}