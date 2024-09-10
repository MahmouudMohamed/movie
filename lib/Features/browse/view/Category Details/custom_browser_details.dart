import 'package:flutter/material.dart';
import 'package:movie/utils/Shared%20Widget/custom_list.dart';

import '../../view_model/category_cubit.dart';

class CustomBrowserDetails extends StatelessWidget {
  dynamic arguments;

  CustomBrowserDetails({required this.arguments, super.key});

  @override
  Widget build(BuildContext context) {
    var view = CategoryCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            arguments.name.toString(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: view.categoryModel?.results?.length ?? 0,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.62),
                  itemBuilder: (context, index) =>
                      CustomList(
                        height: MediaQuery.sizeOf(context).height * 0.30,
                        width: MediaQuery.sizeOf(context).width * 0.46,
                          rate: "${view.categoryModel?.results?[index].voteAverage??""}",
                          date: view.categoryModel?.results?[index].releaseDate??"",
                          title: view.categoryModel?.results?[index].originalTitle??"",
                          poster: view.categoryModel?.results?[index].posterPath??"",
                          id: view.categoryModel?.results?[index].id??0)

                  //     Card(
                  //   color: AppColor.cardColorRecommended,
                  //   clipBehavior: Clip.antiAlias,
                  //                     child: Column(
                  // children: [
                  //   InkWell(
                  //     onTap: () {
                  //       Navigator.pushNamed(context, FilmDetails.routeName,
                  //           arguments:
                  //               view.categoryModel?.results?[index].id??0);
                  //     },
                  //     child: Stack(
                  //       children: [
                  //         CachedNetworkImage(
                  //           imageUrl:
                  //               "${Const.path}${view.categoryModel?.results?[index].posterPath??""}",
                  //           fit: BoxFit.fill,
                  //           height:
                  //           MediaQuery.sizeOf(context).height * 0.30,
                  //           width: MediaQuery.sizeOf(context).height * 0.25,
                  //           placeholder: (context, text) => const Center(
                  //               child: CircularProgressIndicator(
                  //             color: Colors.yellow,
                  //           )),
                  //           errorWidget: (context, url, error) =>
                  //               const Icon(Icons.error),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  //   SizedBox(
                  //     width: MediaQuery.of(context).size.width * 0.38,
                  //     child: Text(
                  //       maxLines: 1,
                  //       overflow: TextOverflow.ellipsis,
                  //       textAlign: TextAlign.center,
                  //       view.categoryModel?.results?[index].originalTitle??"",
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //     ),
                  //   ),
                  //   Center(
                  //     child: Text(
                  //       view.categoryModel?.results?[index].releaseDate??""
                  //           .substring(0, 10),
                  //       style: Theme.of(context).textTheme.bodySmall,
                  //     ),
                  //   ),
                  //   CustomRate(vote: "${view.categoryModel?.results?[index].voteAverage??""}".substring(0,3))
                  // ],
                  //                     ),
                  //                   ),
                ),
              ],
            ),
          ),
        ));
  }
}
