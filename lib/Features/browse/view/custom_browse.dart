import 'package:flutter/material.dart';

import '../../../utils/EndPoint/const.dart';
import '../view_model/category_cubit.dart';
import 'browse_details.dart';

class CustomBrowse extends StatelessWidget {
  CustomBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    var category = CategoryCubit.get(context);
    return SingleChildScrollView(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 15,
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Text(
              "Browse Category",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 22,
              )
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 15,
                mainAxisExtent: 120),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    BrowseDetails.routeName,
                    arguments: category.genresModel?.genres?[index],
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      Const.images[index],
                      fit: BoxFit.cover,
                      width: 180,
                      height: 110,
                    ),
                    Text(
                      category.genresModel?.genres?[index].name ?? '',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,fontSize: 22,
                      )
                    )
                  ],
                ),
              );
            },
            itemCount: category.genresModel?.genres?.length ?? 0,
          ),
        ],
      ),
    );
  }


}
