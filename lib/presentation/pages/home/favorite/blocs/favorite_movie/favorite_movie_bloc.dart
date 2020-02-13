import 'package:bloc/bloc.dart';
import 'package:demo_app/common/models/usecase.dart';
import 'package:demo_app/domain/favorite_movie/usecases/favorite_movie_usescase.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_event.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteMovieBloc extends Bloc<FavoriteMovieEvent, FavoriteMovieState> {
  final GetAllFavoriteMovieUsecase getAllFavoriteMovieUsecase;
  final DeleteFavoriteMovieUsecase deleteFavoriteMovieUsecase;
  final FavoriteMovieByIdUsecase favoriteMovieByIdUsecase;
  final UpdateFavoriteMovieUsecase updateFavoriteMovieUsecase;

  FavoriteMovieBloc({this.getAllFavoriteMovieUsecase, this.deleteFavoriteMovieUsecase, this.favoriteMovieByIdUsecase, this.updateFavoriteMovieUsecase});

  @override
  FavoriteMovieState get initialState => FavoriteMovieInitialState();

  @override
  Stream<FavoriteMovieState> mapEventToState(FavoriteMovieEvent event) async* {
    if (event is FavoriteMovieDeleteEvent) {
      try {
        await deleteFavoriteMovieUsecase(event.favoriteMovieEntity);
        final favoriteMovies = await getAllFavoriteMovieUsecase(NoPayload());
        yield FavoriteMovieStateDelete(favoriteMovies: favoriteMovies);
      } catch (e) {
      }
    } else if (event is FavoriteMovieInitialEvent){
      try{
        final favoriteMovies = await getAllFavoriteMovieUsecase(NoPayload());
        yield FavoriteMovieInitialState(favoriteMovies: favoriteMovies);
      } catch (e){

      }
    } else if(event is FavoriteMovieDetailEvent){
      try{
        final favoriteMovie = await favoriteMovieByIdUsecase(event.id);
        if(favoriteMovie == null){
          yield FavoriteMovieStateDetail(favoriteMovie: event.favoriteMovieEntity, isCreate: true);
        } else {
          yield FavoriteMovieStateDetail(favoriteMovie: favoriteMovie, isCreate: false);
        }
      }catch(e){
      }
    } else if(event is FavoriteMovieUpdateEvent){
      try{
        await updateFavoriteMovieUsecase(event.favoriteMovieEntity);
        yield FavoriteMovieStateUpdate();
      }catch(e){
      }
    }
  }
}
