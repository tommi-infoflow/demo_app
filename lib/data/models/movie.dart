import 'dart:convert';

import 'package:demo_app/domain/movie/entities/movie_entitiy.dart';

class Movie extends MovieEntity{
  Movie({String id, String title, String year, bool viewed, String poster, int priority, int rating, int timestamp}) 
  : super(id : id, title : title, year : year, viewed : viewed, poster : poster, priority : priority, rating : rating, timestamp : timestamp);

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
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

  factory Movie.fromJsonDemoApi(Map<String, dynamic> json){
    return Movie(
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
