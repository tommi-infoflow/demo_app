import 'package:bloc/bloc.dart';
import 'package:demo_app/common/models/usecase.dart';
import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:demo_app/domain/favorite_movie/usecases/favorite_movie_usescase.dart';
import 'package:demo_app/presentation/pages/home/dashboard/bloc/dashboard_movie_event.dart';
import 'package:demo_app/presentation/pages/home/dashboard/bloc/dashboard_movie_state.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class DashboardMovieBloc extends Bloc<DashboarMovieEvent, DashboardMovieState>{
  final GetRecommendedMovieUsecase getRecommendedMovieUsecase;
  final GetAllFavoriteMovieUsecase getAllFavoriteMovieUsecase;

  DashboardMovieBloc({this.getRecommendedMovieUsecase, this.getAllFavoriteMovieUsecase});
  
  @override
  DashboardMovieInitialState get initialState => DashboardMovieInitialState();
  
  @override
  Stream<DashboardMovieDataState> mapEventToState(DashboarMovieEvent event) async* {
    if(event is DashboarMovieDataEvent){
      try{
        final favoriteMovies  = await getAllFavoriteMovieUsecase(NoPayload());

        favoriteMovies.sort((x,y) => x.timestamp.compareTo(y.timestamp));

        List<FavoriteMovieEntity> dashboardMovies = [];
        if(favoriteMovies.length > 3)
          dashboardMovies = favoriteMovies.sublist(0, 3);
        else 
          dashboardMovies = favoriteMovies;

        SharedPreferences _pref = await SharedPreferences.getInstance();
        var showRecommended = _pref.getBool('showRecomended');
        if(showRecommended ?? false){
          final recommendedMovie = await getRecommendedMovieUsecase(NoPayload());
          dashboardMovies.add(recommendedMovie);
        } 
        yield DashboardMovieDataState(dashboardMovies: dashboardMovies);
      }catch (e){
        print(e);
      }
    } 
  }

}