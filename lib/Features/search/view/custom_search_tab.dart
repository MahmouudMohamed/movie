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
              height: MediaQuery.sizeOf(context).height * 0.35,
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
              //     Row(
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Navigator.pushNamed(context, FilmDetails.routeName,
              //             arguments:
              //                 cubit.searchModel?.results?[index].id ?? 0);
              //       },
              //       child: Container(
              //         alignment: Alignment.topLeft,
              //         width: MediaQuery.of(context).size.width * 0.45,
              //         height: MediaQuery.of(context).size.height * 0.30,
              //         child: CachedNetworkImage(
              //           imageUrl: cubit
              //                       .searchModel?.results?[index].posterPath ==
              //                   null
              //               ? Const.wrongImagePoster
              //               : 'https://image.tmdb.org/t/p/w500'
              //                   '${cubit.searchModel?.results?[index].posterPath}',
              //           fit: BoxFit.fill,
              //           height: MediaQuery.sizeOf(context).height * 0.29,
              //           width: MediaQuery.sizeOf(context).height * 0.20,
              //           placeholder: (context, text) => const Center(
              //               child: CircularProgressIndicator(
              //             color: Colors.yellow,
              //           )),
              //           errorWidget: (context, url, error) =>
              //               const Icon(Icons.error),
              //         ),
              //       ),
              //     ),
              //
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             cubit.searchModel?.results?[index].title ?? '',
              //             style:Theme.of(context).textTheme.titleLarge,
              //             maxLines: 2,
              //           ),
              //           const SizedBox(
              //             height: 5,
              //           ),
              //           Text(
              //             cubit.searchModel?.results?[index].releaseDate ?? '',
              //             style: Theme.of(context).textTheme.titleLarge?.
              //             copyWith(fontSize: 13),
              //           ),
              //           const SizedBox(
              //             height: 5,
              //           ),
              //           CustomRate(
              //               vote:
              //                   "${cubit.searchModel?.results?[index].voteAverage}".substring(0,3)??
              //                       '')
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              ),
        );
      }
      return Container();
    });
  }
}
