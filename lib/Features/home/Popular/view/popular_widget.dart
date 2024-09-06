import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/home/Popular/view/custom_popular_movie.dart';

import '../../View_Model/home_cubit.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getPopular(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if (state is PopularLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.yellow,
            ));
          }
          if (state is PopularErrorState) {
            return Center(
              child: Column(
                children: [
                  Text(
                    "${state.errorMes}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          }
          if (state is PopularSuccessState) {
            return CarouselSlider(
                items: cubit.popularMoviesModel?.results?.map((popularIndex) {
                  return CustomPopularMovie(popularIndex: popularIndex);
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height * 0.38,
                ));
          }
          return Container();
        },
      ),
    );
  }
}
