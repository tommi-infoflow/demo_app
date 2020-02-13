import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class FavoriteMovieEvent {}

@immutable
class FavoriteMovieInitialEvent extends FavoriteMovieEvent {}

@immutable
class FavoriteMovieDeleteEvent extends FavoriteMovieEvent {
  final FavoriteMovieEntity favoriteMovieEntity;

  FavoriteMovieDeleteEvent({this.favoriteMovieEntity});
}

@immutable
class FavoriteMovieDetailEvent extends FavoriteMovieEvent {
  final String id;

  FavoriteMovieDetailEvent({this.id});
}
