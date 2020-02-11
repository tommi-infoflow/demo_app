import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/movie/usecases/movie_usescase.dart';
import 'package:demo_app/presentation/blocs/movie/movie_event.dart';
import 'package:demo_app/presentation/blocs/movie/movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final SearchMovieUsecase searchMovieUsecase;

  MovieBloc({@required this.searchMovieUsecase});

  @override
  MovieState get initialState => MovieInitialState();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is MovieEventSearch) {
      try {
        Map<String, dynamic> param = {'title': event.title, 'year': event.year};
        final movies = await searchMovieUsecase(param);
        yield MovieDataState(movies: movies);
      } catch (e) {
        yield MovieErrorState(e);
      }
    } else if(event is MovieEventInit){
      yield MovieLoadingState();
    }
  }
}
