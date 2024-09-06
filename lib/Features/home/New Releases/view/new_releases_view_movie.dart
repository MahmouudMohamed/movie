import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/utils/EndPoint/const.dart';

import '../../../../utils/Shared Widget/book_mark.dart';
import '../../View_Model/home_cubit.dart';

class NewReleasesViewMovie extends StatelessWidget {
  NewReleasesViewMovie({super.key});

  bool checkMark = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => HomeCubit()..getNewReleasesMovies(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var view=HomeCubit.get(context);
          if (state is NewReleaseLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ));
            }
            if (state is NewReleaseErrorState) {
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

            if (state is NewReleaseSuccessState) {
              return  SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.26,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(width: 15,),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          // onTap: () {
                          //   //id
                          //   Navigator.pushNamed(context, FilmDetails.routeName,arguments :view.newReleaseModel?.results?[index].id);
                          // },
                          child: Card(
                            child: Stack(
                              children: [
                              CachedNetworkImage(
                              imageUrl: "${Const.path}${view.newReleaseModel?.results?[index].posterPath??""}",
                              fit: BoxFit.fill,
                              height: MediaQuery.sizeOf(context).height * 0.25,
                              width:140 ,
                              placeholder: (context, text) =>
                                  const Center(child: CircularProgressIndicator(color: Colors.yellow,)),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),

                                // const BookMark()

                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount:view.newReleaseModel?.results?.length??0,
                ),
              );
            }
            return const SizedBox();
          }),
    );



  }
}
