import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/utils/EndPoint/end_points.dart';
import 'package:http/http.dart' as http;

import '../../../utils/EndPoint/const.dart';
import '../model/MovieDetailsModel.dart';
import '../model/SmillerMoviesModel.dart';
import '../model/VideoModel.dart';

part 'film_detalis_state.dart';

class FilmDetailsCubit extends Cubit<FilmDetailsState> {
  FilmDetailsCubit() : super(FilmDetailsInitial());
  MovieDetailsModel? movieDetailsModel;
  SmillerMoviesModel? similarMoviesModel;
  VideoModel? videoModel;

  static FilmDetailsCubit get(context) => BlocProvider.of(context);

  getMovieDetails(movieId) async {
    emit(MovieDetailsLoadingState());
    Uri url = Uri.https(
      EndPoints.host,
      "/3/movie/$movieId",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        movieDetailsModel = MovieDetailsModel.fromJson(
          jsonDecode(response.body),
        );
        emit(MovieDetailsSuccessState());
      } else {
        emit(MovieDetailsErrorState());
      }
    } catch (error) {
      emit(MovieDetailsErrorState());
    }
  }

  getSimilarMovieDetails(movieId) async {
    emit(SimilarMoviesLoadingState());
    Uri url = Uri.https(
      EndPoints.host,
      "/3/movie/$movieId/similar",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        similarMoviesModel = SmillerMoviesModel.fromJson(
          jsonDecode(response.body),
        );
        emit(SimilarMoviesSuccessState());
      } else {
        emit(SimilarMoviesErrorState());
      }
    } catch (error) {
      emit(SimilarMoviesErrorState());
    }
  }

  getVideoMovie(movieId) async {
    emit(VideoMovieLoadingState());
    Uri url = Uri.https(
      EndPoints.host,
      "/3/movie/$movieId/videos",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        videoModel = VideoModel.fromJson(
          jsonDecode(response.body),
        );
        emit(VideoMovieSuccessState());
      } else {
        emit(VideoMovieErrorState());
      }
    } catch (error) {
      emit(VideoMovieErrorState());
    }
  }
}
