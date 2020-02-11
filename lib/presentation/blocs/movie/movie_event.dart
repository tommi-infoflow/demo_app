import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(MovieEventSearch)
@immutable
abstract class MovieEvent{
  
}

@immutable
class MovieEventInit extends MovieEvent{}

@immutable
class MovieEventSearch extends MovieEvent{
  final String title;
  final String year;

  MovieEventSearch(this.title, this.year);
}