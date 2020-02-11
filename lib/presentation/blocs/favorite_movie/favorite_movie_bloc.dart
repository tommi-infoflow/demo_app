import 'package:bloc/bloc.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_event.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteMovieBloc extends Bloc<FavoriteMovieEvent, FavoriteMovieState>{
  @override
  FavoriteMovieState get initialState => null;

  @override
  Stream<FavoriteMovieState> mapEventToState(FavoriteMovieEvent event) {
    return null;
  }

}