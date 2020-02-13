import 'package:bloc/bloc.dart';
import 'package:demo_app/common/models/usecase.dart';
import 'package:demo_app/domain/favorite_movie/usecases/favorite_movie_usescase.dart';
import 'package:demo_app/presentation/pages/home/search/blocs/favorite_movie/search_movie_event.dart';
import 'package:demo_app/presentation/pages/home/search/blocs/favorite_movie/search_movie_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState>{
  final GetAllFavoriteMovieUsecase getAllFavoriteMovieUsecase;
  final CreateFavoriteMovieUsecase createFavoriteMovieUsecase;

  SearchMovieBloc({this.getAllFavoriteMovieUsecase, this.createFavoriteMovieUsecase});

  @override
  SearchMovieState get initialState => SearchMovieInitialState();
  
  @override
  Stream<SearchMovieState> mapEventToState(SearchMovieEvent event) async* {
    if(event is SearchMovieEventInitial){
      try{
        final favoriteMovies = await getAllFavoriteMovieUsecase(NoPayload());
        favoriteMovies.sort((x, y) => y.timestamp.compareTo(x.timestamp));
        var result = favoriteMovies.sublist(0, 3);
        yield SearchMovieStateDashboard(favoriteMovies: result);
      }catch (e){
        print(e);
      }
    } else if (event is SearchMovieAddEvent){ 
      try{
        createFavoriteMovieUsecase(event.movieEntity);
      } catch(e){
        print(e);
      }
    }
  }

}