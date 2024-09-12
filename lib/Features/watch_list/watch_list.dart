import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/watch_list/view_model/watch_list_cubit.dart';
import 'package:movie/utils/Shared%20Widget/custom_search_watchlist_widget.dart';

class WatchList extends StatelessWidget {
  static const String routeName = "w";

  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      WatchListCubit()
        ..getWatchList(),
      child: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          var watchList = WatchListCubit.get(context);
          if (state is GetMoviesWatchListLoadingState|| state is AddMoviesWatchListLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
          if (state is GetMoviesWatchListErrorState) {
            return const Center(
              child: Column(
                children: [
                  Text(
                    "Some Error Occurred",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }
          if (state is GetMoviesWatchListSuccessState ) {
            if (watchList.watchListModel?.results?.isEmpty ?? true) {
              return  Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.40,
                    ),
                    Image.asset(
                      "assets/images/empty.png",
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Text('No movies Found',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              );
            }
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: watchList.watchListModel?.results?.length ?? 0,
                          itemBuilder: (context, index) =>
                              CustomSearchWatchlistWidget(
                                  rate: "${watchList.watchListModel?.results?[index]
                                      .voteAverage ?? ""}",
                                  date: watchList.watchListModel?.results?[index]
                                      .releaseDate ?? "",
                                  title: watchList.watchListModel?.results?[index]
                                      .title ?? "",
                                  poster: watchList.watchListModel?.results?[index]
                                      .posterPath ?? "",
                                  id: watchList.watchListModel?.results?[index]
                                      .id ?? 0),
                          separatorBuilder: (BuildContext context,
                              int index) => const SizedBox(height: 5,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        }),
    );
  }
}
