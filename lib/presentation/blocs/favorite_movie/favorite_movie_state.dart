import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class FavoriteMovieState{}

@immutable
class FavoriteMovieInitialState extends FavoriteMovieState{
  final List<FavoriteMovieEntity> favoriteMovies;

  FavoriteMovieInitialState({this.favoriteMovies});
}

@immutable
class FavoriteMovieStateDashboard extends FavoriteMovieState{
  final List<FavoriteMovieEntity> favoriteMovies;

  FavoriteMovieStateDashboard({this.favoriteMovies});
}