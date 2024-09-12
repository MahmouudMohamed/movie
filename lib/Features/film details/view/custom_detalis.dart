import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/Features/watch_list/view_model/watch_list_cubit.dart';
import 'package:movie/utils/Shared%20Widget/book_mark.dart';

import '../../../utils/EndPoint/const.dart';
import '../../../utils/Shared Widget/category_chip.dart';
import '../../../utils/Shared Widget/custom_rate.dart';
import '../../browse/view/Category Details/browse_details.dart';
import '../view model/film_detalis_cubit.dart';
import 'Video/video.dart';

class CustomDetalis extends StatelessWidget {
  int id;
   CustomDetalis({required this.id,super.key});



  @override
  Widget build(BuildContext context) {
    var cubit=FilmDetailsCubit.get(context);
    var view=WatchListCubit.get(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl:'${Const.path}${cubit.movieDetailsModel?.posterPath??""}',
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    width: MediaQuery.sizeOf(context).width * 0.45,
                    placeholder: (context, text) => const Center(
                        child: CircularProgressIndicator(
                          color: Colors.yellow,
                        )),
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error,color: Colors.white,),
                  ),

                  BookMark(id: id),

                ],
              ),
              const SizedBox(height: 5,),
              Video(id: id),
              const SizedBox(height: 5,),

            ],
          ),
        ),

        SizedBox(
          width: MediaQuery.sizeOf(context).height * 0.009,
        ),
        Expanded(
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 30,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 10),
                itemCount: cubit.movieDetailsModel?.genres
                    ?.length ??
                    0,
                itemBuilder: (context, index) =>

                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, BrowseDetails.routeName,
                          arguments: cubit.movieDetailsModel?.genres?[index],
                        );
                      },
                      child: CategoryChip(
                          text: cubit.movieDetailsModel
                              ?.genres?[index].name ??
                              ""),
                    ),
              ),
              const SizedBox(height: 10,),
              Center(
                child: Text(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 9,
                  cubit.movieDetailsModel?.overview ?? "",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15
                  ),
                ),
              ),
              CustomRate(
                  vote:
                  "${cubit.movieDetailsModel?.voteAverage}"
                      .substring(0, 3))
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.02,
        ),
      ],
    );
  }
}
