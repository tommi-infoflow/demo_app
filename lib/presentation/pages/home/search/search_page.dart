import 'package:demo_app/domain/movie/entities/movie_entitiy.dart';
import 'package:demo_app/presentation/blocs/movie/movie_bloc.dart';
import 'package:demo_app/presentation/blocs/movie/movie_event.dart';
import 'package:demo_app/presentation/blocs/movie/movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<MovieEntity> _movies = [];
  TextEditingController _searchTitleController;
  TextEditingController _searchYearController;

  @override
  initState() {
    super.initState();
    _searchTitleController = TextEditingController();
    _searchYearController = TextEditingController();
    BlocProvider.of<MovieBloc>(context).add(MovieEventInit());
  }

  @override
  dispose() {
    _searchTitleController.dispose();
    _searchYearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      _buildFormSearch(),
      Container(
          child: BlocConsumer<MovieBloc, MovieState>(
        listener: (context, state) {
          if (state is MovieErrorState) {
            _showNetworkErrorDialog();
          } else if (state is MovieLoadingState) {
            // setState(() {
            //   _titleSearch = state.title;
            //   _yearSearch = state.year;
            // });
          }
        },
        builder: (context, state) {
          if (state is MovieDataState) {
            _movies = state.movies;
            return _buildMovieList();
          } else {
            return _buildProgressBar();
          }
        },
      ))
    ]);
  }

  Widget _buildFormSearch() {
    return Form(
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                _formTitle(),
                Padding(padding: EdgeInsets.symmetric(horizontal: 3.0)),
                _formYear(),
                _formButtonSearch(),
              ],
            )));
  }

  Widget _formTitle() {
    return Flexible(
      flex: 5,
      child: TextField(
        controller: _searchTitleController,
        decoration:
            InputDecoration(border: OutlineInputBorder(), labelText: 'Title'),
      ),
    );
  }

  Widget _formYear() {
    return Flexible(
        flex: 2,
        child: TextField(
          controller: _searchYearController,
          decoration:
              InputDecoration(border: OutlineInputBorder(), labelText: 'Year'),
        ));
  }

  Widget _formButtonSearch() {
    return Flexible(
        flex: 1,
        child: RaisedButton(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.search,
              size: 30,
            ),
            color: Colors.blue,
            shape: CircleBorder(),
            onPressed: () {
              BlocProvider.of<MovieBloc>(context)
                  .add(MovieEventSearch(_searchTitleController.text, _searchYearController.text));
            }));
  }

  Widget _buildMovieList() {
    if (_movies == null) {
      return _buildProgressBar();
    } else {
      return Expanded(
          child: Container(
        child: _searchMovieList(
          _movies,
        ),
      ));
    }
  }

  Widget _buildProgressBar() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _searchMovieList(List<MovieEntity> movies) {
    return ListView.builder(
        padding: EdgeInsets.all(3.0),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.network(movies[index].poster),
                  ListTile(
                      title: Text(
                        movies[index].title,
                        style: Theme.of(context).textTheme.title.copyWith(
                              color: Colors.brown,
                            ),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      contentPadding: EdgeInsets.only(left: 20.0),
                      subtitle: Text(
                        movies[index].year,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Colors.brown),
                        textAlign: TextAlign.left,
                      ),
                      trailing: RaisedButton(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            Icons.add,
                            size: 30,
                          ),
                          color: Colors.blue,
                          shape: CircleBorder(),
                          onPressed: () {
                            // _addToFavorite(widget.movies[index]);
                          })),
                ],
              ),
            ),
          );
        });
  }

  void _showNetworkErrorDialog() {
    showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("No Connection"),
          content: new Text("Network connection error, try again later"),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  BlocProvider.of<MovieBloc>(context)
                      .add(MovieEventSearch(_searchTitleController.text, _searchYearController.text));
                },
                child: Text('Retry')),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel')),
          ],
        ));
  }
}
