import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class DashboardMovieState{}

@immutable
class DashboardMovieInitialState extends DashboardMovieState{}

@immutable
class DashboardMovieDataState extends DashboardMovieState{
  final List<FavoriteMovieEntity> dashboardMovies;

  DashboardMovieDataState({this.dashboardMovies});
}