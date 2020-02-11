import 'package:demo_app/data/repositories/favorite_movie_repository.dart';
import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(FavoriteMovieRepositoryImpl)
@injectable
abstract class FavoriteMovieRepository {
  Future<List<FavoriteMovieEntity>> getAllfavoriteMovies();
  Future<FavoriteMovieEntity> recommendedMovies();
  Future<void> addToFavoriteMovie(FavoriteMovieEntity movieEntity);
  Future<void> deleteFavoriteMovie(FavoriteMovieEntity movieEntity);
  Future<void> updateFavoriteMovie(FavoriteMovieEntity movieEntity);
}

