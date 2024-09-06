part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class ChangeHomeState extends HomeState {}

class ChangeBookMarkState extends HomeState {}

class PopularLoadingState extends HomeState {}

class PopularSuccessState extends HomeState {}

class PopularErrorState extends HomeState {
  String? errorMes;

  PopularErrorState({this.errorMes});
}

class NewReleaseLoadingState extends HomeState {}

class NewReleaseSuccessState extends HomeState {}

class NewReleaseErrorState extends HomeState {
  String? errorMes;

  NewReleaseErrorState({this.errorMes});
}

class RecommendedLoadingState extends HomeState {}

class RecommendedSuccessState extends HomeState {}

class RecommendedErrorState extends HomeState {
  String? errorMes;

  RecommendedErrorState({this.errorMes});
}
