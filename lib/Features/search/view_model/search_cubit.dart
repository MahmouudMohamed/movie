import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:movie/Features/search/model/SearchModel.dart';
import 'package:movie/utils/EndPoint/end_points.dart';

import '../../../utils/EndPoint/const.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  getSearchMovie(String query) async {
    emit(SearchMovieLoadingState());
    Uri url = Uri.https(
      EndPoints.host,
      EndPoints.searchMovie,
      {'language': 'en', "query": query},
    );
    try {
      var response = await http.get(url, headers: Const.headers);
      if (response.statusCode == 200) {
        searchModel = SearchModel.fromJson(
          jsonDecode(response.body),
        );
        emit(SearchMovieSuccessState());
      } else {
        emit(SearchMovieErrorState());
      }
    } catch (error) {
      emit(SearchMovieErrorState());
    }
  }
}
