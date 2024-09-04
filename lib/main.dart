import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/tabs/browse.dart';
import 'package:movie/tabs/home.dart';
import 'package:movie/tabs/search.dart';
import 'package:movie/tabs/watch_list.dart';
import 'package:movie/utils/bloc_observer.dart';
import 'package:movie/utils/my_theme_data.dart';

import 'home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,

      routes: {
        HomeScreen.routeName:(context)=> HomeScreen(),
        Home.routeName:(context)=> Home(),
        Search.routeName:(context)=> Search(),
        Browse.routeName:(context)=> Browse(),
        WatchList.routeName:(context)=> WatchList(),
      },
    );
  }
}
