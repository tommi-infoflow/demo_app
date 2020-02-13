import 'package:demo_app/common/routes/routes.dart';
import 'package:demo_app/data/models/favorite_movie.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'blocs/favorite_movie/favorite_movie_event.dart';

class FavoriteDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteDetailPageState();
}

class FavoriteDetailPageState extends State<FavoriteDetailPage> {
  List listPriority = ['LOW', 'MEDIUM', 'HIGH'];
  FavoriteMovie _movieDetail;
  TextEditingController _labelController;
//  bool _isCreate;

  @override
  void initState() {
    super.initState();
    _labelController = TextEditingController();
    _labelController.text = _movieDetail?.label;
  }

  @override
  void dispose() {
    _labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Detail Page'),
      ),
      body: BlocConsumer<FavoriteMovieBloc, FavoriteMovieState>(
          builder: (context, state) {
            if (state is FavoriteMovieStateDetail) {
              _movieDetail = state.favoriteMovie;
              _labelController.text = _movieDetail?.label;
              // _isCreate = state.isCreate;
            }
            return _buildDetailMovie();
          },
          listener: (context, state) {}),
    );
  }

  Widget _buildDetailMovie() {
    if (_movieDetail == null) return Container();

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _movieDetail.title,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 30, color: Colors.deepPurple[800]),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Flexible(
                  child: Image.network(_movieDetail.poster),
                  flex: 1,
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildContentText('Year : ${_movieDetail.year}'),
                      _buildContentText('Rating : ${_movieDetail.rating}'),
                      _buildRating(),
                      _buildContentText(
                          'Priority : ${listPriority[_movieDetail.priority]}'),
                      _buildPriority(),
                      _buildContentText('Viewed : ${_movieDetail.viewed}'),
                      _buildViewedButton(),
                      _buildContentText(
                          'Edited Time : \n${_intToDate(_movieDetail.timestamp.toString()) ?? 0}',
                          15.0),
                    ],
                  ),
                ),
              ],
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildContentText('Label : '),
                TextFormField(
                  controller: _labelController,
                  textAlign: TextAlign.left,
                ),
                RaisedButton(
                    child: Text('Submit'),
                    color: Colors.blue,
                    onPressed: () {
                      _movieDetail.label = _labelController.text;
                      _movieDetail.timestamp = _dateToInt();
                      // if (!_isCreate) {
                        BlocProvider.of<FavoriteMovieBloc>(context).add(
                            FavoriteMovieUpdateEvent(
                                favoriteMovieEntity: _movieDetail));
                      // } else {
                      //       BlocProvider.of<SearchMovieBloc>(context).add(
                      //           SearchMovieAddEvent(movieEntity: MovieEntity.fromJsonDemoApi(_movieDetail.toJson())));
                      // }
                      Navigator.of(context).pushNamed(Routes.favoriteList);
                    })
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildContentText(String text, [double size]) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
      child: Text(
        text,
        style: TextStyle(fontSize: size ?? 20, color: Colors.deepPurple[600]),
      ),
    );
  }

  Widget _buildRating() {
    return RatingBar(
        initialRating: _movieDetail.rating.toDouble(),
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 10,
        itemSize: 18.0,
        itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
        onRatingUpdate: (rating) {
          setState(() {
            _movieDetail.rating = rating.toInt();
          });
        });
  }

  Widget _buildPriority() {
    return RatingBar(
        initialRating: _movieDetail.priority.toDouble(),
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 2,
        itemSize: 25.0,
        itemBuilder: (context, _) => Icon(
              Icons.priority_high,
              color: Colors.red,
            ),
        onRatingUpdate: (priority) {
          setState(() {
            _movieDetail.priority = priority.toInt();
          });
        });
  }

  Widget _buildViewedButton() {
    return Switch(
        value: _movieDetail.viewed,
        onChanged: (value) {
          setState(() {
            _movieDetail.viewed = value;
          });
        });
  }

  int _dateToInt() {
    try {
      DateTime now = DateTime.now();

      String _month = _twodigit(now.month.toString());
      String _day = _twodigit(now.day.toString());
      String _hour = _twodigit(now.hour.toString());
      String _minute = _twodigit(now.minute.toString());
      String _second = _twodigit(now.second.toString());
      String _milisecond = _twodigit(now.millisecond.toString());

      return int.parse(
          '${now.year}$_month$_day$_hour$_minute$_second$_milisecond');
    } catch (e) {
      return 0;
    }
  }

  DateTime _intToDate(String dateString) {
    try {
      int year = int.parse(dateString.substring(0, 4));
      int month = int.parse(dateString.substring(4, 6));
      int day = int.parse(dateString.substring(6, 8));
      int hour = int.parse(dateString.substring(8, 10));
      int minute = int.parse(dateString.substring(10, 12));
      int second = int.parse(dateString.substring(12, 14));
      int milisecond = int.parse(dateString.substring(14));
      return DateTime.utc(year, month, day, hour, minute, second, milisecond);
    } catch (e) {
      return DateTime.now();
    }
  }

  String _twodigit(String dateComponent) {
    if (dateComponent.length == 1) return '0$dateComponent';
    return dateComponent;
  }
}
