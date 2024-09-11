import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/tabs/watch_list.dart';
import 'package:movie/utils/bloc_observer.dart';
import 'package:movie/utils/my_theme_data.dart';
import 'Features/browse/view/Category/browse.dart';
import 'Features/browse/view/Category Details/browse_details.dart';
import 'Features/film details/view/film_details.dart';
import 'Features/home/view/home.dart';
import 'Features/search/view/search.dart';
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
        Home.routeName: (context) => const Home(),
        Search.routeName: (context) => const Search(),
        Browse.routeName: (context) => const Browse(),
        WatchList.routeName: (context) => WatchList(),
        BrowseDetails.routeName: (context) => const BrowseDetails(),
        FilmDetails.routeName: (context) => const FilmDetails(),
      },
    );
  }
}
