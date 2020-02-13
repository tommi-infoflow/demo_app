import 'dart:convert';

import 'package:demo_app/data/models/movie.dart';

abstract class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String homePath = 'home';
  static const String home = '/$homePath';
  static const String dashboardPath = 'dashboard';
  static const String dashboard = '$home/$dashboardPath';
  static const String searchPath = 'search';
  static const String search = '$homePath/$searchPath';
  static const String favoriteListPath = 'favoriteList';
  static const String favoriteList = '$homePath/$favoriteListPath';
  static const String favoriteDetailsPath = 'favoriteDetails';
  static const String favoriteDetails = '$homePath/$favoriteDetailsPath';
  static const String favoriteDetailsNewPath = 'new';  
  static const String favoriteDetailsNewMovieParameter = 'movie';
  static const String settingsPath = 'settings';
  static const String settings = '$home/$settingsPath';

  static String createFavoriteDetails(Movie movie) {
    return '/$favoriteDetailsPath/new?movie=${Uri.encodeQueryComponent(jsonEncode(movie.toJson()))}';
  }

  static String editFavoriteDetails(String id) {
    return '/$favoriteDetailsPath/$id';
  }
}
