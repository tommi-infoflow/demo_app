import 'package:flutter/widgets.dart';

@immutable
abstract class MovieEvent{}

@immutable
class MovieEventInit extends MovieEvent{}

@immutable
class MovieEventSearch extends MovieEvent{
  final String title;
  final String year;

  MovieEventSearch(this.title, this.year);
}