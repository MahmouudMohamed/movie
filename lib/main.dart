import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/Features/home/View_Model/home_cubit.dart';
import 'package:movie/tabs/search.dart';
import 'package:movie/tabs/watch_list.dart';
import 'package:movie/utils/bloc_observer.dart';
import 'package:movie/utils/my_theme_data.dart';

import 'Features/browse/view/browse.dart';
import 'Features/browse/view/browse_details.dart';
import 'Features/film_details.dart';
import 'Features/home/view/home.dart';
import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,

      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Home.routeName: (context) => Home(),
        Search.routeName: (context) => Search(),
        Browse.routeName: (context) => Browse(),
        WatchList.routeName: (context) => WatchList(),
        BrowseDetails.routeName: (context) => BrowseDetails(),
        FilmDetails.routeName: (context) => FilmDetails(),
      },
    );
  }
}
