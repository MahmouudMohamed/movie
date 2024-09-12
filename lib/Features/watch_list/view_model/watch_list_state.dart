part of 'watch_list_cubit.dart';

sealed class WatchListState {}

final class WatchListInitial extends WatchListState {}
final class NewState extends WatchListState {}


final class GetMoviesWatchListLoadingState extends WatchListState {}
final class GetMoviesWatchListSuccessState extends WatchListState {}
final class GetMoviesWatchListErrorState extends WatchListState {}

final class AddMoviesWatchListLoadingState extends WatchListState {}
final class AddMoviesWatchListSuccessState extends WatchListState {}
final class AddMoviesWatchListErrorState extends WatchListState {}