import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/search/view_model/search_cubit.dart';
import 'package:movie/utils/Shared%20Widget/custom_search_watchlist_widget.dart';
class CustomSearchTab extends StatelessWidget {
  const CustomSearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      var cubit = SearchCubit.get(context);
      if (state is SearchMovieLoadingState) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        );
      }
      if (cubit.searchModel?.results?.isEmpty ??
          true && state is! SearchMovieLoadingState) {
        return Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.30,
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
        );
      }
      if (state is SearchMovieErrorState) {
        return const Center(
          child: Text(
            "Some Error Occurred",
            style: TextStyle(color: Colors.white),
          ),
        );
      }
      if (state is SearchMovieSuccessState) {
        return Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) =>
                  const Divider(thickness: 2, color: Colors.white, height: 20),
              itemCount: cubit.searchModel?.results?.length ?? 0,
              itemBuilder: (context, index) => CustomSearchWatchlistWidget(
                  rate:
                      "${cubit.searchModel?.results?[index].voteAverage ?? ""}"
                          .substring(0, 3),
                  date: cubit.searchModel?.results?[index].releaseDate ?? '',
                  title: cubit.searchModel?.results?[index].title ?? '',
                  poster: cubit.searchModel?.results?[index].posterPath ?? "",
                  id: cubit.searchModel!.results![index].id!)

              ),
        );
      }
      return Container();
    });
  }
}
