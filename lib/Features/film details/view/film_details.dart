import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/film%20details/view%20model/film_detalis_cubit.dart';
import 'package:movie/Features/film%20details/view/similar_movies.dart';
import 'package:movie/Features/watch_list/view_model/watch_list_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../utils/EndPoint/const.dart';
import 'custom_detalis.dart';

class FilmDetails extends StatelessWidget {
  static const String routeName = "FilmDetails";

  const FilmDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments as dynamic;
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => FilmDetailsCubit()
        ..getMovieDetails(id)
        ..getSimilarMovieDetails(id)
        ..getVideoMovie(id),
),
    BlocProvider(
      create: (context) => WatchListCubit()..getWatchList(),
    ),
  ],
  child: BlocBuilder<FilmDetailsCubit, FilmDetailsState>(
        builder: (context, state) {
          var cubit = FilmDetailsCubit.get(context);
          if (state is MovieDetailsLoadingState ||
              state is SimilarMoviesLoadingState ||
              state is VideoMovieLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellowAccent,
              ),
            );
          }
          if (state is MovieDetailsErrorState ||
              state is SimilarMoviesErrorState ||
              state is VideoMovieErrorState) {
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
          if (state is MovieDetailsSuccessState ||
              state is SimilarMoviesSuccessState ||
              state is VideoMovieSuccessState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "${cubit.movieDetailsModel?.title}",
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: cubit.movieDetailsModel?.backdropPath == null
                          ? Const.wrongImageBack
                          : '${Const.path}${cubit.movieDetailsModel?.backdropPath ?? ""}',
                      fit: BoxFit.fill,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: double.infinity,
                      placeholder: (context, text) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.3,
                          width: double.infinity,
                          color: Colors.grey[600]!,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "${cubit.movieDetailsModel?.title}",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.001),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "${cubit.movieDetailsModel?.releaseDate}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.02),
                        CustomDetalis(id: id),
                        SimilarMovies(id: id,
                        )

                        // SimilarMovies(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
);
  }
}
