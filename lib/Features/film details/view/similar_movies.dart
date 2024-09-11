import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/film%20details/view%20model/film_detalis_cubit.dart';
import 'package:movie/utils/Shared%20Widget/custom_list.dart';
import '../../../utils/EndPoint/const.dart';
import '../../../utils/Shared Widget/row_category.dart';

class SimilarMovies extends StatelessWidget {
  int id;

  SimilarMovies({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmDetailsCubit()..getSimilarMovieDetails(id),
      child: BlocBuilder<FilmDetailsCubit, FilmDetailsState>(
        builder: (context, state) {
          var cubit = FilmDetailsCubit.get(context);
          if (state is SimilarMoviesLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            ));
          }
          if (state is SimilarMoviesErrorState) {
            return const Center(
              child: Column(
                children: [
                  Text(
                    "Error Occurred",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }

          if (state is SimilarMoviesSuccessState) {
            if (cubit.similarMoviesModel?.results?.isEmpty == true) {
              return const Center(
                  child: Text(
                "No Similar Movies Found",
                style: TextStyle(color: Colors.white),
              ));
            }
            return Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xff282A28),
              child: Column(children: [
                RowCategory(left: "More Like This"),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.36,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 15,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final results = cubit.similarMoviesModel?.results ?? [];
                      final movie = results[index];
                      return CustomList(
                        rate: "${movie.voteAverage ?? ""}",
                        date: movie.releaseDate ?? "",
                        title: movie.title ?? "",
                        poster: "${Const.path}${movie.posterPath ?? ""}",
                        id: movie.id!,
                        width: MediaQuery.sizeOf(context).width * 0.40,
                        height: MediaQuery.sizeOf(context).height * 0.29,
                      );
                    },
                    itemCount: cubit.similarMoviesModel?.results?.length ?? 0,
                  ),
                ),
              ]),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
