part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}
class SearchMovieLoadingState extends SearchState {}

class SearchMovieSuccessState extends SearchState {}

class SearchMovieErrorState extends SearchState {}