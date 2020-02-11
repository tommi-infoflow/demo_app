import 'package:bloc/bloc.dart';
import 'package:demo_app/common/models/usecase.dart';
import 'package:demo_app/domain/favorite_movie/usecases/favorite_movie_usescase.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_event.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteMovieBloc extends Bloc<FavoriteMovieEvent, FavoriteMovieState>{
  final GetAllFavoriteMovieUsecase getAllFavoriteMovieUsecase;

  FavoriteMovieBloc({this.getAllFavoriteMovieUsecase});

  @override
  FavoriteMovieState get initialState => FavoriteMovieInitialState();
  
  @override
  Stream<FavoriteMovieState> mapEventToState(FavoriteMovieEvent event) async* {
    if(event is FavoriteMovieEventDashboard){
      try{
        final favoriteMovies = await getAllFavoriteMovieUsecase(NoPayload());
        yield FavoriteMovieStateDashboard(favoriteMovies: favoriteMovies);
      }catch (e){
        print(e);
      }
    } 
  }

}