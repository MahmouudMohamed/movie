import 'package:flutter/material.dart';
import 'package:movie/Features/home/Popular/view/popular_widget.dart';
import '../New Releases/view/new_releases_widget.dart';
import '../Recommended/view/recommended_widget.dart';


class Home extends StatelessWidget {
  static const String routeName = "home1";

   const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const SingleChildScrollView(
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
    );
  }
}

