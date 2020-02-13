import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:demo_app/presentation/pages/home/dashboard/bloc/dashboard_movie_event.dart';
import 'package:demo_app/presentation/pages/home/dashboard/bloc/dashboard_movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dashboard_movie_bloc.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<FavoriteMovieEntity> _movieList = [];

  @override
  initState() {
    super.initState();
    BlocProvider.of<DashboardMovieBloc>(context).add(DashboarMovieDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<DashboardMovieBloc, DashboardMovieState>(
          builder: (context, state) {
        if (state is DashboardMovieDataState) {
          _movieList = state.dashboardMovies;
          return _buildListDashboard();
        }
        return Center(child: CircularProgressIndicator());
      }, listener: (context, state) {
      }),
    );
  }

  Widget _buildListDashboard() {
    if (_movieList == null) {
      return Center(child: Text('Movie Not Found'));
    }
    return ListView.builder(
        itemCount: _movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              color: Colors.yellow[100],
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: Image.network(_movieList[index].poster,
                          fit: BoxFit.fitWidth),
                    ),
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
