import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../Features/film_details.dart';
import '../EndPoint/const.dart';
import '../app_color.dart';
import 'custom_rate.dart';

class CustomList extends StatelessWidget {
  String rate;
  String date;
  String title;
  String poster;
  int id;
  double width;
  double height;

  CustomList(
      {required this.rate,
      required this.date,
      required this.title,
      required this.poster,
      required this.id,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.cardColorRecommended,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            overlayColor: WidgetStateColor.transparent,
            onTap: () {
              Navigator.pushNamed(context, FilmDetails.routeName,
                  arguments: id);
            },
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "${Const.path}$poster",
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                  placeholder: (context, text) => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.yellow,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
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
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Center(
            child: Text(
              date.substring(0, 10),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          CustomRate(vote: rate.substring(0, 3))
        ],
      ),
    );
  }
}
