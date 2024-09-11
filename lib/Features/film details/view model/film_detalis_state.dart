part of 'film_detalis_cubit.dart';


abstract class FilmDetailsState {}

final class FilmDetailsInitial extends FilmDetailsState {}

class SimilarMoviesLoadingState extends FilmDetailsState {}

class SimilarMoviesSuccessState extends FilmDetailsState {}

class SimilarMoviesErrorState extends FilmDetailsState {}

class VideoMovieLoadingState extends FilmDetailsState {}

class VideoMovieSuccessState extends FilmDetailsState {}

class VideoMovieErrorState extends FilmDetailsState {}


class MovieDetailsLoadingState extends FilmDetailsState {}

class MovieDetailsSuccessState extends FilmDetailsState {}

class MovieDetailsErrorState extends FilmDetailsState {
  // String? errorMes;
  // MovieDetailsErrorState({this.errorMes});
}