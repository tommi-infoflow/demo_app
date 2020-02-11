import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/movie/usecases/movie_usescase.dart';
import 'package:demo_app/presentation/blocs/movie/movie_event.dart';
import 'package:demo_app/presentation/blocs/movie/movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final String title;
  final String year;
  final SearchMovieUsecase searchMovieUsecase;

  MovieBloc(
      {@required this.searchMovieUsecase, @required this.title, this.year});

  @override
  MovieState get initialState => MovieInitialState();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    yield* _searchMovies(title, year);
  }

  Stream<MovieState> _searchMovies(String title, String year) async* {
    yield MovieLoadingState(title: title, year: year);
    try {
      Map<String, dynamic> param = {'title': title, 'year': year};
      final movies = await searchMovieUsecase(param);
      yield MovieDataState(movies: movies);
    } catch (e) {
      MovieErrorState(e);
    }
  }
}
