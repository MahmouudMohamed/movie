import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../Shared Widget/custom_rate.dart';

class ShimmerPopular extends StatelessWidget {
  const ShimmerPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: CarouselSlider(
          items: List.generate(
            10, // Number of skeleton loaders to display
                (index) => Builder(
              builder: (BuildContext context) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[600]!,
                  highlightColor: Colors.grey[200]!,
                  child: Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[600]!,
                      ),
                      Positioned(
                        top: 95,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height * 0.28,
                                    width: MediaQuery.of(context).size.width * 0.38,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.25),
                                          spreadRadius: 3,
                                          blurRadius: 2,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(15),
                                                
                                    ),
                                    ),
                                ],
                              ),
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
                                      "",
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                  Text(
                                     "",
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  CustomRate(
                                      vote: ""
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ), options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        height: MediaQuery.of(context).size.height * 0.40,
      ),
          
          )
    );
  }
}
