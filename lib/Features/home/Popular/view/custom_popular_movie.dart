import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/Shared%20Widget/book_mark.dart';
import '../../../../utils/Shared Widget/custom_rate.dart';
import '../../../../utils/EndPoint/const.dart';
import '../../../film details/view/film_details.dart';
import '../model/PopularMoviesModel.dart';

class CustomPopularMovie extends StatelessWidget {
  Results? popularIndex;

  CustomPopularMovie(
      {super.key, required this.popularIndex}); // Results results;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.32,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "${Const.path}${popularIndex?.backdropPath ?? Const.wrongImageBack}",
              fit: BoxFit.cover,
              placeholder: (context, text) => const CircularProgressIndicator(
                color: Colors.yellow,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
              top: 95,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    InkWell(
                      overlayColor: WidgetStateColor.transparent,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            FilmDetails.routeName,
                            arguments: popularIndex?.id,
                          );
                        },
                        child: Card(
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                imageUrl:
                                    "${Const.path}${popularIndex?.posterPath ?? Const.wrongImagePoster}",
                                height: MediaQuery.of(context).size.height * 0.28,
                                fit: BoxFit.fill,
                                placeholder: (context, text) => const Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.yellow,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                              BookMark()
                            ],
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            maxLines: 2,
                            popularIndex?.title ?? "",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Text(
                          popularIndex?.releaseDate ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        CustomRate(
                            vote: "${popularIndex?.voteAverage ?? ""}"
                                .substring(0, 3))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
