import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/utils/EndPoint/const.dart';
import 'package:movie/utils/EndPoint/end_points.dart';
import 'package:http/http.dart' as http;
import '../../../tabs/browse.dart';
import '../../../tabs/search.dart';
import '../../../tabs/watch_list.dart';
import '../Recommended/model/RecommendedModel.dart';
import '../view/home.dart';
import '../New Releases/model/NewReleaseModel.dart';
import '../Popular/model/PopularMoviesModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int index = 0;
  bool checkMark = false;
  List<Widget> page = [
    Home(),
    Search(),
    Browse(),
    WatchList(),
  ];
  PopularMoviesModel? popularMoviesModel;
  NewReleaseModel? newReleaseModel;
  RecommendedModel? recommendedModel;

  changeHomeScreen(value) {
    index = value;
    emit(ChangeHomeState());
  }
  changeBookMark() {
    checkMark = !checkMark;
    emit(ChangeBookMarkState());
  }

  getPopular() async {
    emit(PopularLoadingState());
    Uri url = Uri.https(
      EndPoints.host,
      EndPoints.popularMovies,
      {
        'language': 'en',
      },
    );

    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        popularMoviesModel = PopularMoviesModel.fromJson(
          jsonDecode(response.body),
        );
        emit(PopularSuccessState());
      } else {
        emit(PopularErrorState());
      }
    } catch (error) {
      emit(PopularErrorState(errorMes: error.toString()));
    }
  }

  getNewReleasesMovies() async {
    emit(NewReleaseLoadingState());
    Uri url = Uri.https(
      EndPoints.host,
      EndPoints.newReleasesMovies,
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        newReleaseModel = NewReleaseModel.fromJson(
          jsonDecode(response.body),
        );
        emit(NewReleaseSuccessState());
      } else {
        emit(NewReleaseErrorState());
      }
    } catch (error) {
      emit(NewReleaseErrorState(errorMes: error.toString()));
    }
  }

  getRecommendedMovies() async {
    emit(RecommendedLoadingState());
    Uri url = Uri.https(
      EndPoints.host,
      EndPoints.recommendedMovie,
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        recommendedModel = RecommendedModel.fromJson(
          jsonDecode(response.body),
        );
        emit(RecommendedSuccessState());
      } else {
        emit(RecommendedErrorState());
      }
    } catch (error) {
      emit(RecommendedErrorState(errorMes: error.toString()));
    }
  }
}
