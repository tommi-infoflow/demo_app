import 'dart:convert';

import 'package:demo_app/domain/favorite_movie/entities/favorite_movie_entitiy.dart';

class FavoriteMovie extends FavoriteMovieEntity{
  FavoriteMovie({String id, String title, String year, bool viewed, String poster, int priority, int rating, int timestamp}) 
  : super(id : id, title : title, year : year, viewed : viewed, poster : poster, priority : priority, rating : rating, timestamp : timestamp);

  factory FavoriteMovie.fromJson(Map<String, dynamic> json){
    return FavoriteMovie(
      id: json['id'],
      title: json['Title'],
      year: json['Year'],
      viewed: json['Viewed'],
      poster: json['Poster'],
      priority: json['Priority'],
      rating: json['Rating'],
      timestamp: json['Timestamp']
    );
  }

  factory FavoriteMovie.fromJsonDemoApi(Map<String, dynamic> json){
    return FavoriteMovie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      viewed: json['viewed'],
      poster: json['poster'],
      priority: json['priority'],
      rating: json['rating'],
      timestamp: json['timestamp']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : this.id,
      'title' : this.title,
      'year' : this.year,
      'viewed' : this.viewed,
      'poster' : this.poster,
      'priority' : this.priority,
      'rating' : this.rating,
      'timestamp' : this.timestamp
    };
  }

  String toString(){
    return jsonEncode(toJson());
  }
}
