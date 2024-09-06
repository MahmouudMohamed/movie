import 'package:flutter/material.dart';
import 'package:movie/Features/home/New%20Releases/view/new_releases_view_movie.dart';

import '../../../../utils/Shared Widget/row_category.dart';


class NewReleasesWidget extends StatelessWidget {
  const NewReleasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.03),
      padding: const EdgeInsets.all(20),
      color: const Color(0xff282A28),
      child: Column(
        children: [
          RowCategory(left: "New Releases"),
          const SizedBox(height: 15,),
          NewReleasesViewMovie(),
        ],
      ),
    );
  }
}
