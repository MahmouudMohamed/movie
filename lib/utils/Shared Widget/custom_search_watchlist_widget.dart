import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/Shared%20Widget/book_mark.dart';
import 'package:shimmer/shimmer.dart';

import '../../Features/film details/view/film_details.dart';
import '../EndPoint/const.dart';
import 'custom_rate.dart';

class CustomSearchWatchlistWidget extends StatelessWidget {
  String rate;
  String date;
  String title;
  String poster;
  int id;

  CustomSearchWatchlistWidget(
      {required this.rate,
      required this.date,
      required this.title,
      required this.poster,
      required this.id,
      // required this.width,
      // required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          InkWell(
            overlayColor: WidgetStateColor.transparent,
            onTap: () {
              Navigator.pushNamed(context, FilmDetails.routeName,
                  arguments: id);
            },
            child: Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Stack(
                children: [
                  CachedNetworkImage(

                    imageUrl:"${Const.path}$poster",
                    fit: BoxFit.fill,
                    height: MediaQuery.sizeOf(context).height * 0.30,
                    width: MediaQuery.sizeOf(context).width * 0.40,
                    placeholder: (context, text) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.30,
                        width: MediaQuery.sizeOf(context).width * 0.40,
                        color: Colors.grey[600]!,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.white,),
                  ),
                  BookMark(id: id)
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 13),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomRate(vote: rate.substring(0, 3))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
