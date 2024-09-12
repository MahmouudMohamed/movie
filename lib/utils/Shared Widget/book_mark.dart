import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/watch_list/view_model/watch_list_cubit.dart';

class BookMark extends StatelessWidget {
  int id;

  BookMark({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListCubit, WatchListState>(
      builder: (context, state) {
        var watchList = WatchListCubit.get(context);
        if (state is AddMoviesWatchListLoadingState) {
          return const CircularProgressIndicator(
            color: Colors.yellow,
          );
        }

        bool isAddedWatchList = watchList.watchListModel?.results?.any((
            e) => e.id == id ? true : false) ?? false;
        return InkWell(
            onTap: () {
              watchList.addToWatchList(
                isWatchList: isAddedWatchList ? false : true,
                id: id,
              );
            },
            child: isAddedWatchList ?
            Image.asset(
                "assets/images/bookmark.png")
                : Image.asset(
                "assets/images/unbookmark.png"));
      },
    );
  }
}
