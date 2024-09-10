part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class GenreMovieLoadingState extends CategoryState {}
final class GenreMovieSuccessState extends CategoryState {}
final class GenreMovieErrorState extends CategoryState {}

final class BrowseShowLoadingState extends CategoryState {}
final class BrowseShowSuccessState extends CategoryState {}
final class BrowseShowErrorState extends CategoryState {}
