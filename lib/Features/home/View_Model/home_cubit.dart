import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../tabs/browse.dart';
import '../../../tabs/home.dart';
import '../../../tabs/search.dart';
import '../../../tabs/watch_list.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int index = 0;

  List<Widget> page = [
    Home(),
    Search(),
    Browse(),
    WatchList(),
  ];
  changeHomeScreen(value){
    index = value;
    emit(ChangeHomeState());
  }
}
