import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class SearchMovieState{}

@immutable
class SearchMovieInitialState extends SearchMovieState{
  final List<FavoriteMovieEntity> favoriteMovies;

  SearchMovieInitialState({this.favoriteMovies});
}

@immutable
class SearchMovieStateDashboard extends SearchMovieState{
  final List<FavoriteMovieEntity> favoriteMovies;

  SearchMovieStateDashboard({this.favoriteMovies});
}

@immutable
class SearchMovieAddState extends SearchMovieState{}