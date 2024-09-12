import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/home/Popular/view/popular_widget.dart';
import 'package:movie/Features/watch_list/view_model/watch_list_cubit.dart';
import '../New Releases/view/new_releases_widget.dart';
import '../Recommended/view/recommended_widget.dart';


class Home extends StatelessWidget {
  static const String routeName = "home1";

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListCubit()..getWatchList(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PopularWidget(),
              NewReleasesWidget(),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: RecommendedWidget(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

