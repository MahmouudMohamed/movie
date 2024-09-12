import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../../utils/EndPoint/const.dart';
import '../../../utils/EndPoint/end_points.dart';
import '../model/watch_list_model.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit() : super(WatchListInitial());

  static WatchListCubit get(context) => BlocProvider.of(context);

  WatchListModel? watchListModel;

  getWatchList() async {
    emit(GetMoviesWatchListLoadingState());
    Uri uri = Uri.https(
      EndPoints.host,
      '/3/account/${Const.accountID}/watchlist/movies',
      {
        'language': 'en',
        // 'account_id': Constants.accountID,
      },
    );

    try {
      final response = await http.get(uri, headers: Const.headers);

      if (response.statusCode == 200) {
        watchListModel = WatchListModel.fromJson(
          jsonDecode(response.body),
        );
        emit(GetMoviesWatchListSuccessState());
      } else {
        emit(GetMoviesWatchListErrorState());
      }
    } catch (e) {
      emit(GetMoviesWatchListErrorState());
      // print(error.toString());
    }
  }

  addToWatchList({id, required bool isWatchList}) async {
    emit(AddMoviesWatchListLoadingState());
    Uri uri = Uri.https(
      EndPoints.host,
      '/3/account/${Const.accountID}/watchlist',
      {
        'language': 'en',
      },
    );

    try {
      final response = await http.post(
        uri,
        headers: Const.headers,
        body: jsonEncode({
          'media_type': 'movie',
          'media_id': id,
          'watchlist': isWatchList,
        }),
      );

      debugPrint('Response status: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        watchListModel = WatchListModel.fromJson(
          jsonDecode(response.body),
        );
        emit(AddMoviesWatchListSuccessState());
        getWatchList();
      } else {
        emit(AddMoviesWatchListErrorState());
      }
    } catch (error) {
      emit(AddMoviesWatchListErrorState());
      print('Error: ${error.toString()}');
    }
  }
}
