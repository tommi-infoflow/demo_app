import 'package:demo_app/domain/movie/entities/movie_entitiy.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class MovieState {}

@immutable
class MovieInitialState extends MovieState {}

@immutable
class MovieLoadingState extends MovieState {
  final String title;
  final String year;

  MovieLoadingState({this.title, this.year});
}

@immutable
class MovieDataState extends MovieState {
  final List<MovieEntity> movies;

  MovieDataState({this.movies});
}

@immutable
class MovieErrorState extends MovieState {
  final dynamic error;

  MovieErrorState(this.error);
}
