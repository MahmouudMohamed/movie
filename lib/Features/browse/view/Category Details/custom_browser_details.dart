import 'package:flutter/material.dart';
import 'package:movie/utils/Shared%20Widget/custom_list.dart';

import '../../view_model/category_cubit.dart';

class CustomBrowserDetails extends StatelessWidget {
  dynamic arguments;

  CustomBrowserDetails({required this.arguments, super.key});

  @override
  Widget build(BuildContext context) {
    var view = CategoryCubit.get(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            arguments.name.toString(),
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: view.categoryModel?.results?.length ?? 0,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.60),
                    itemBuilder: (context, index) => CustomList(
                        height: MediaQuery.sizeOf(context).height * 0.30,
                        width: MediaQuery.sizeOf(context).width * 0.46,
                        rate:
                            "${view.categoryModel?.results?[index].voteAverage ?? ""}",
                        date: view.categoryModel?.results?[index].releaseDate ??
                            "",
                        title:
                            view.categoryModel?.results?[index].originalTitle ??
                                "",
                        poster:
                            view.categoryModel?.results?[index].posterPath ??
                                "",
                        id: view.categoryModel?.results?[index].id ?? 0)),
              ],
            ),
          ),
        ));
  }
}
