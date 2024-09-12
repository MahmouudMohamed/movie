import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  double heightSizedBox;
  double heightContainerImage;
  double widthContainerImage;
   ShimmerCard({required this.heightSizedBox,required this.heightContainerImage,required this.widthContainerImage,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.sizeOf(context).height * heightSizedBox,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          scrollDirection: Axis.horizontal,
          itemCount: 15, // The number of shimmer items
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[600]!,
              highlightColor: Colors.grey[200]!,
              child: SingleChildScrollView(
                child: Card(
                  color: Colors.grey,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: MediaQuery.sizeOf(context).height * heightContainerImage,
                            width: MediaQuery.sizeOf(context).width * widthContainerImage,
                            color: Colors.grey[300],
                          ),
                          const Positioned(
                            top: 8.0,
                            right: 8.0,
                            child:
                                Icon(Icons.bookmark_border, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                        child: Container(
                          color: Colors.grey[300],
                          height: 20,
                        ),
                      ),
                      Center(
                        child: Container(
                          color: Colors.grey[500],
                          height: 20,
                          width: MediaQuery.of(context).size.width * 0.38,
                        ),
                      ),
                      Container(
                        color: Colors.grey[400],
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.38,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
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