import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../utils/EndPoint/const.dart';
import '../model/CategoryModel.dart';
import '../model/GenresModel.dart';


part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  static CategoryCubit get(context) => BlocProvider.of<CategoryCubit>(context);
  static const String host = "api.themoviedb.org";

  GenresModel? genresModel;
  CategoryModel? categoryModel;

  getGenreMovies() async {
    emit(GenreMovieLoadingState());
    Uri url = Uri.https(
      host,
      "/3/genre/movie/list",
      {
        'language': 'en',
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        genresModel = GenresModel.fromJson(
          jsonDecode(response.body),
        );
        emit(GenreMovieSuccessState());
      } else {
        emit(GenreMovieErrorState());
      }
    } catch (error) {
      emit(GenreMovieErrorState());
    }
  }

  getBrowseShow(categoryId) async {
    emit(BrowseShowLoadingState());
    Uri url = Uri.https(
      host,
      "/3/discover/movie",
      {
        'language': 'en',
        'with_genres': categoryId.toString(),
      },
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        categoryModel = CategoryModel.fromJson(
          jsonDecode(response.body),
        );
        emit(BrowseShowSuccessState());
      } else {
        emit(BrowseShowErrorState());
      }
    } catch (error) {
      emit(BrowseShowErrorState());
    }
  }
}
