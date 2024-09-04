import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Features/home/View_Model/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                    iconSize: 30,
                    currentIndex: cubit.index,
                    onTap: (value) {
                      cubit.changeHomeScreen(value);
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage(
                                "assets/images/home.png",
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "HOME",
                      ),
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/search.png"),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "SEARCH",
                      ),
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/browse.png"),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "BROWSE",
                      ),
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/watchlist.png"),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "WATCHLIST",
                      ),
                    ]),
                body: cubit.page[cubit.index]),
          );
        },
      ),
    );
  }

}