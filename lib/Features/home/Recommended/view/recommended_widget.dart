import 'package:flutter/material.dart';
import 'package:movie/Features/home/Recommended/view/reccommended_view_movie.dart';

import '../../../../utils/Shared Widget/row_category.dart';


class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.03),
      padding: const EdgeInsets.all(20),
      color: const Color(0xff282A28),
      child: Column(
        children: [
          RowCategory(left: "Recommended"),
          const SizedBox(height: 15,),
          const RecommendedViewMovie(),
        ],
      ),
    );
  }
}
