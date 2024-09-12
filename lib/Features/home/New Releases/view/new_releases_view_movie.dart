import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/utils/EndPoint/const.dart';
import 'package:movie/utils/Shimmer/shimmer_card.dart';
import 'package:redacted/redacted.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/Shared Widget/book_mark.dart';
import '../../../film details/view/film_details.dart';
import '../../View_Model/home_cubit.dart';

class NewReleasesViewMovie extends StatelessWidget {
  NewReleasesViewMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getNewReleasesMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        var view = HomeCubit.get(context);
        if (state is NewReleaseLoadingState) {
          return ShimmerCard(heightSizedBox: 0.29,heightContainerImage: 0.28,widthContainerImage: 0.38,).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  animationDuration:
                  const Duration(milliseconds: 800), //default
                ),

          );
        }
        if (state is NewReleaseErrorState) {
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

        if (state is NewReleaseSuccessState) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.29,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 15,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      overlayColor: WidgetStateColor.transparent,
                      onTap: () {
                        //id
                        Navigator.pushNamed(context, FilmDetails.routeName,
                            arguments:
                                view.newReleaseModel?.results?[index].id);
                      },
                      child: Card(
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  "${Const.path}${view.newReleaseModel?.results?[index].posterPath ?? ""}",
                              fit: BoxFit.fill,
                              height: MediaQuery.sizeOf(context).height * 0.28,
                              width: MediaQuery.sizeOf(context).width * 0.38,
                              placeholder: (context, text) =>  Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: MediaQuery.sizeOf(context).height * 0.28,
                                  width: MediaQuery.sizeOf(context).width * 0.38,
                                  color: Colors.grey[600]!,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),

                             BookMark(id: view.newReleaseModel!.results![index].id!,)
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: view.newReleaseModel?.results?.length ?? 0,
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }
}
