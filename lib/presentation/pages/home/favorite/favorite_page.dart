import 'package:demo_app/common/network/omdb_ws_client.dart';
import 'package:demo_app/data/datasources/favorite_movie_datasource.dart';
import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FavoritePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => FavoritePageState();
}

class FavoritePageState extends State<FavoritePage>{
  List<FavoriteMovieEntity> _movieList = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  FavoriteMovieDatasource get movieDS => FavoriteMovieDatasourceImpl(
        omdbWsClient: OmdbWsClientImpl(http.Client()),
      );

  void _getData() async {
    try {
      final movieFromDS = await movieDS.getAllFavoriteMovies();
      if (mounted) {
        setState(() {
          _movieList = movieFromDS;
        });
      }
    } catch (e) {
      print('exception : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _movieList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5.0),
            child: Card(
              color: Colors.yellow[100],
              child: InkWell(
                onTap: (){
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