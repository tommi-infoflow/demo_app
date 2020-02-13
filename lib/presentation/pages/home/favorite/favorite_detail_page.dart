import 'package:demo_app/data/models/favorite_movie.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_bloc.dart';
import 'package:demo_app/presentation/pages/home/favorite/blocs/favorite_movie/favorite_movie_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FavoriteDetailPageState();
}

class FavoriteDetailPageState extends State<FavoriteDetailPage> {
  List listPriority = ['LOW', 'MEDIUM', 'HIGH'];

  FavoriteMovie _movieDetail;

  @override
  void initState() {
    super.initState();
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
            Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
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
                      _buildContentText('Timestamp : ${_movieDetail.timestamp}'),
                    ],
                  ),
                ),
              ],
            ),
            Form(
                child: Column(
              children: <Widget>[
                TextFormField(),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildContentText(String text) {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 5.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: Colors.deepPurple[600]),
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
}
