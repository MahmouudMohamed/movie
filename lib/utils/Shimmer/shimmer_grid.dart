import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            width: 200,
            height:35,
            color: Colors.grey[400],
            child: Text(
              "",
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,
                mainAxisExtent: 120),
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[600]!,
                highlightColor: Colors.grey[200]!,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.40,
                      color: Colors.grey[300],
                    ),
                    Container(
                      color: Colors.grey[400],
                    )
                  ],
                ),
              );
            },
            itemCount: 13,
          ),
        ),
      ],
    );
  }
}
//Shimmer.fromColors(
//               baseColor: Colors.grey[600]!,
//               highlightColor: Colors.grey[200]!,
//               child: Card(
//                   color: Colors.grey,
//                   clipBehavior: Clip.antiAlias,
//                   child: Column(children: [
//                     Stack(
//                       children: [
//                         Container(
//                           height: MediaQuery.sizeOf(context).height * 0.26,
//                           width: MediaQuery.sizeOf(context).height * 0.19,
//                           color: Colors.grey[300],
//                         ),
//                         Positioned(
//                           top: 8.0,
//                           right: 8.0,
//                           child:
//                               Icon(Icons.bookmark_border, color: Colors.white),
//                         )
//                       ],
//                     ),
//                   ])));
