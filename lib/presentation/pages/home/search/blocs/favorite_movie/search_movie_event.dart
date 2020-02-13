import 'package:demo_app/domain/movie/entities/movie_entitiy.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class SearchMovieEvent {}

@immutable
class SearchMovieEventInitial extends SearchMovieEvent {}

@immutable
class SearchMovieAddEvent extends SearchMovieEvent {
  final MovieEntity movieEntity;

  SearchMovieAddEvent({this.movieEntity});
}
