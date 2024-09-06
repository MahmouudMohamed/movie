import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/Shared Widget/book_mark.dart';
import '../../../../utils/Shared Widget/custom_rate.dart';
import '../../../../utils/EndPoint/const.dart';
import '../../../../utils/app_color.dart';
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
            return SizedBox
              (
              height: MediaQuery.sizeOf(context).height * 0.33,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return
                    Card(
                    color: AppColor.cardColorRecommended,
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        InkWell(
                          // onTap: () {
                          //   Navigator.pushNamed(context, FilmDetails.routeName,
                          //       arguments:
                          //           cubit.recommendedModel!.results![index].id);
                          // },
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "${Const.path}${cubit.recommendedModel!.results![index].posterPath!}",
                                fit: BoxFit.fill,
                                height: MediaQuery.sizeOf(context).height * 0.26,
                                width: MediaQuery.sizeOf(context).height * 0.19,
                                placeholder: (context, text) => const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              // const BookMark()
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.38,
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            cubit.recommendedModel?.results![index].originalTitle??"",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        Center(
                          child: Text(
                            cubit.recommendedModel!.results![index].releaseDate!
                                .substring(0, 10),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        CustomRate(vote: "${cubit.recommendedModel!.results![index].voteAverage}".substring(0,3))
                      ],
                    ),
                  );
                },
                itemCount: cubit.recommendedModel!.results!.length,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );


  }
}
