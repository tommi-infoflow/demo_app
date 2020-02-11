class FavoriteMovieEntity {
  final String id;
  final String title;
  final String year;
  final bool viewed;
  final String poster;
  final int priority;
  final int rating;
  final int timestamp;

  FavoriteMovieEntity({this.id, this.title, this.year, this.viewed, this.poster, this.priority, this.rating, this.timestamp});

  FavoriteMovieEntity copyWith(
    String id,
    String title,
    String year,
    bool viewed, 
    String poster,
    int priority, 
    int rating, 
    int timestamp
  ) => FavoriteMovieEntity(
    id: id ?? this.id,
    title: title ?? this.title, 
    year: year ?? this.year, 
    viewed: viewed ?? this.viewed,
    poster: poster ?? this.poster, 
    priority: priority ?? this.priority,
    rating: rating ?? this.rating, 
    timestamp: timestamp ?? timestamp
  );
}
