import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_event.dart';
import 'package:demo_app/presentation/blocs/favorite_movie/favorite_movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<FavoriteMovieEntity> _movieList = [];

  @override
  initState() {
    // super.initState();
    BlocProvider.of<FavoriteMovieBloc>(context)
        .add(FavoriteMovieEventDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<FavoriteMovieBloc, FavoriteMovieState>(
          builder: (context, state) {
            print('builder state : $state');
            if(state is FavoriteMovieStateDashboard){
              _movieList = state.favoriteMovies;
              return _buildListDashboard();
            } else if (state is FavoriteMovieInitialState){              
              return Container();
            }
          }, listener: (context, state) {
            print('listener state : $state');
          }),
    );
  }

  Widget _buildListDashboard() {
    return ListView.builder(
        itemCount: _movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              color: Colors.yellow[100],
              child: InkWell(
                onTap: () {
                  print('${_movieList[index].title}');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.network(_movieList[index].poster),
                    ListTile(
                      title: Text(
                        _movieList[index].title,
                        style: Theme.of(context).textTheme.title.copyWith(
                              color: Colors.brown,
                            ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        _movieList[index].year,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.brown),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
