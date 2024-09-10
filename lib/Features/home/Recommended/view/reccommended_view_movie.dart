import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/utils/Shared%20Widget/custom_list.dart';
import '../../View_Model/home_cubit.dart';

class RecommendedViewMovie extends StatelessWidget {
  const RecommendedViewMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getRecommendedMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is RecommendedLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            ));
          }
          if (state is RecommendedErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "${state.errorMes}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }

          if (state is RecommendedSuccessState) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.34,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomList(
                      height: MediaQuery.sizeOf(context).height * 0.27,
                      width: MediaQuery.of(context).size.width * 0.40,
                      rate:
                          "${cubit.recommendedModel?.results?[index].voteAverage ?? ""}"
                              .substring(0, 3),
                      date:
                          cubit.recommendedModel?.results?[index].releaseDate ??
                              "No Yet".substring(0, 10),
                      title: cubit.recommendedModel?.results![index]
                              .originalTitle ??
                          "",
                      poster:
                          cubit.recommendedModel?.results?[index].posterPath ??
                              "",
                      id: cubit.recommendedModel?.results?[index].id ?? 0);
                },
                itemCount: cubit.recommendedModel?.results?.length ?? 0,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
