import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/category_cubit.dart';
import 'custom_browse.dart';

class Browse extends StatelessWidget {
  static const String routeName = "b";

  const Browse({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => CategoryCubit()..getGenreMovies(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if(state is GenreMovieLoadingState){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              )
            );
          }
          if (state is GenreMovieErrorState) {
            return const Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if(state is GenreMovieSuccessState){
          return CustomBrowse();}
          return Container();
        },
      ),
    );
  }
}
