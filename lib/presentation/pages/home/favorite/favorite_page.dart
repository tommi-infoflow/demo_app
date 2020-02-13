import 'package:demo_app/common/routes/routes.dart';
import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_event.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snaplist/size_providers.dart';
import 'package:snaplist/snaplist.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage> {
  List<FavoriteMovieEntity> _movieList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteMovieBloc>(context)
        .add(FavoriteMovieInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteMovieBloc, FavoriteMovieState>(
      builder: (context, state) {
        if (state is FavoriteMovieInitialState) {
          _movieList = state.favoriteMovies;
        } else if (state is FavoriteMovieStateDelete) {
          _movieList = state.favoriteMovies;
        }
        return SnapList(
            padding: EdgeInsets.symmetric(horizontal: 1.0),
            alignment: Alignment.center,
            sizeProvider: (index, data) => Size(280.0, 500.0),
            builder: (context, index, data) {
              return _buildSnaplistObject(context, index, data);
            },
            separatorProvider: (index, data) => Size(6.0, 0.0),
            count: _movieList?.length ?? 0);
      },
      listener: (context, state) {},
    );
  }

  Widget _buildSubtitle(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle.copyWith(color: Colors.brown),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTitle(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.title.copyWith(
            color: Colors.brown,
          ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildImage(String imageLink) {
    return SizedBox(
      child: Image.network(
        imageLink,
        fit: BoxFit.fill,
      ),
      width: 280,
      height: 400,
    );
  }

  Widget _buildSnaplistObject(
      BuildContext context, int index, BuilderData data) {
    return Dismissible(
        background: Container(
          child: Icon(
            Icons.delete,
            color: Colors.red,
            size: 50,
          ),
          alignment: Alignment.bottomCenter,
        ),
        key: Key(_movieList[index].id),
        direction: DismissDirection.up,
        onDismissed: (direction) {
          BlocProvider.of<FavoriteMovieBloc>(context).add(
              FavoriteMovieDeleteEvent(favoriteMovieEntity: _movieList[index]));
        },
        child: SizedBox(
          child: InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(Routes.editFavoriteDetails(_movieList[index].id));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildImage(_movieList[index].poster),
                ListTile(
                  title: _buildTitle(_movieList[index].title),
                  subtitle: _buildSubtitle(_movieList[index].year),
                )
              ],
            ),
          ),
          width: 280.0,
          height: 500.0,
        ));
  }
}
