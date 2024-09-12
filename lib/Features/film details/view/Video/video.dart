import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/film%20details/view%20model/film_detalis_cubit.dart';
import 'package:movie/utils/EndPoint/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Video extends StatelessWidget {
  int id;

  Video({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FilmDetailsCubit()..getVideoMovie(id),
      child: BlocBuilder<FilmDetailsCubit, FilmDetailsState>(
        builder: (context, state) {
          var cubit = FilmDetailsCubit.get(context);
          if (state is VideoMovieSuccessState) {
            return ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    fixedSize: Size(
                      MediaQuery.sizeOf(context).width * 0.42,
                      MediaQuery.sizeOf(context).height * 0.05,
                    )),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            backgroundColor: Colors.black.withOpacity(0.6),
                            title: const Center(
                                child: Text(
                              "Choose Trailer",
                              style: TextStyle(color: Colors.yellow),
                            )),
                            content: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.2,
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                child: ListView.separated(
                                    itemCount:
                                        cubit.videoModel?.results?.length ?? 0,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 5,
                                        ),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => TextButton(
                                          onPressed: () {
                                            Uri uri = Uri.parse(
                                                '${Const.pathYoutube}${cubit.videoModel?.results?[index].key ?? "no movie"}');
                                            launchUrl(uri);
                                            Navigator.pop(context);
                                          },
                                          child: Center(
                                              child: Text(
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                cubit.videoModel?.results?[index].key==null?"No Trailers Available":
                                            'Trailer${index + 1} : ${cubit.videoModel?.results?[index].name??""}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          )
                                          ),
                                        )
                                )
                            ));
                      });
                },
                child: const Text(
                  "Watch Trailer",
                  style: TextStyle(color: Colors.black),
                ));
          }
          return Container();
        },
      ),
    );
  }
}
