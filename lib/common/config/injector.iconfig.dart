// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:demo_app/common/network/omdb_ws_client.dart';
import 'package:http/src/client.dart';
import 'package:demo_app/data/datasources/favorite_movie_datasource.dart';
import 'package:demo_app/data/datasources/movie_datasource.dart';
import 'package:demo_app/data/repositories/favorite_movie_repository.dart';
import 'package:demo_app/data/repositories/movie_repository.dart';
import 'package:demo_app/domain/favorite_movie/repositories/favorite_movie_repository.dart';
import 'package:demo_app/domain/favorite_movie/usecases/favorite_movie_usescase.dart';
import 'package:demo_app/domain/movie/repositories/movie_repository.dart';
import 'package:demo_app/domain/movie/usecases/movie_usescase.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:demo_app/presentation/blocs/movie/movie_bloc.dart';
import 'package:demo_app/presentation/blocs/preferences/preferences_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<OmdbWsClient>(() => OmdbWsClientImpl(getIt<Client>()))
    ..registerLazySingleton<OmdbWsClientImpl>(
        () => OmdbWsClientImpl(getIt<Client>()))
    ..registerFactory<FavoriteMovieDatasource>(
        () => FavoriteMovieDatasourceImpl(omdbWsClient: getIt<OmdbWsClient>()))
    ..registerLazySingleton<FavoriteMovieDatasourceImpl>(
        () => FavoriteMovieDatasourceImpl(omdbWsClient: getIt<OmdbWsClient>()))
    ..registerFactory<MovieDatasource>(
        () => MovieDatasourceImpl(omdbWsClient: getIt<OmdbWsClient>()))
    ..registerLazySingleton<MovieDatasourceImpl>(
        () => MovieDatasourceImpl(omdbWsClient: getIt<OmdbWsClient>()))
    ..registerLazySingleton<FavoriteMovieRepositoryImpl>(
        () => FavoriteMovieRepositoryImpl(getIt<FavoriteMovieDatasource>()))
    ..registerLazySingleton<MovieRepositoryImpl>(
        () => MovieRepositoryImpl(getIt<MovieDatasource>()))
    ..registerFactory<FavoriteMovieRepository>(
        () => FavoriteMovieRepositoryImpl(getIt<FavoriteMovieDatasource>()))
    ..registerLazySingleton<GetAllFavoriteMovieUsecase>(() => GetAllFavoriteMovieUsecase(
        favoriteMovieRepository: getIt<FavoriteMovieRepository>()))
    ..registerLazySingleton<CreateFavoriteMovieUsecase>(() =>
        CreateFavoriteMovieUsecase(
            favoriteMovieRepository: getIt<FavoriteMovieRepository>()))
    ..registerLazySingleton<UpdateFavoriteMovieUsecase>(
        () => UpdateFavoriteMovieUsecase(favoriteMovieRepository: getIt<FavoriteMovieRepository>()))
    ..registerLazySingleton<DeleteFavoriteMovieUsecase>(() => DeleteFavoriteMovieUsecase(favoriteMovieRepository: getIt<FavoriteMovieRepository>()))
    ..registerFactory<MovieRepository>(() => MovieRepositoryImpl(getIt<MovieDatasource>()))
    ..registerLazySingleton<SearchMovieUsecase>(() => SearchMovieUsecase(movieRepository: getIt<MovieRepository>()))
    ..registerFactory<FavoriteMovieBloc>(() => FavoriteMovieBloc(getAllFavoriteMovieUsecase: getIt<GetAllFavoriteMovieUsecase>()))
    ..registerFactory<MovieBloc>(() => MovieBloc(searchMovieUsecase: getIt<SearchMovieUsecase>()))
    ..registerFactory<PreferencesBloc>(() => PreferencesBloc());
}
