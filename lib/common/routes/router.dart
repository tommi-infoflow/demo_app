import 'package:demo_app/common/config/injector.dart';
import 'package:demo_app/common/enum/home_page_enum.dart';
import 'package:demo_app/common/routes/routes.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:demo_app/presentation/blocs/movie/movie_bloc.dart';
import 'package:demo_app/presentation/pages/home/home_page.dart';
import 'package:demo_app/presentation/pages/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class Router {
  static Widget home = _buildHomePage(page: HomePageOptions.search);

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return _buildSplashRoute(settings);
      case Routes.home:
        return _buildHomeRoute(settings);
      case Routes.dashboard:
        return _buildDashboardRoute(settings);
      case Routes.search:
        return _buildSearchRoute(settings);
      case Routes.favoriteList:
        return _buildFavoriteRoute(settings);
      case Routes.settings:
        return _buildSettingsRoute(settings);
    }

    final uri = Uri.parse(settings.name);
    final List<String> pathElements = uri.path.split('/');
    if (pathElements[1] == Routes.favoriteDetailsPath) {
      // if (pathElements[2] == Routes.favoriteDetailsNewPath) {
      //   final asteroidJson =
      //       uri.queryParameters[Routes.favoriteDetailsNewAsteroidParameter];
      //   final asteroidRaw = jsonDecode(asteroidJson);
      //   final asteroid = FavoriteAsteroid.fromJson(asteroidRaw);
      //   return _buildFavoriteDetailsRoute(settings, asteroid: asteroid);
      // } else {
      //   final id = pathElements[2];
      //   return _buildFavoriteDetailsRoute(settings, id: id);
      // }
    }

    return null;
  }

  static Widget _buildHomePage({HomePageOptions page}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (BuildContext context) => getIt<MovieBloc>(),
        ),
        BlocProvider<FavoriteMovieBloc>(
          create: (BuildContext context) => getIt<FavoriteMovieBloc>(),
        ),
      ],
      child: HomePage(page: page),
    );
  }

    static Route _buildSplashRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => SplashPage(),
    );
  }

  static Route _buildHomeRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(),
    );
  }

  static Route _buildDashboardRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.dashboard),
    );
  }

  static Route _buildSearchRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.search),
    );
  }

  static Route _buildFavoriteRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.favorite),
    );
  }

  static Route _buildSettingsRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => _buildHomePage(page: HomePageOptions.settings),
    );
  }

/*
  static Route _buildFavoriteDetailsRoute(
    RouteSettings settings, {
    String id,
    FavoriteMovieEntity movie,
  }) {
    var initialEvent;
    if (movie != null) {
      // initialEvent = FavoriteAsteroidDetailsSetEvent(movie);
    } else {
      int idInt = int.parse(id);
      // initialEvent = FavoriteAsteroidDetailsGetByIdEvent(idInt);
    }
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
          create: (BuildContext context) =>
              getIt<FavoriteM>()..add(initialEvent),
          child: FavoriteAsteroidDetailsPage()),
    );
  }
  */
}
