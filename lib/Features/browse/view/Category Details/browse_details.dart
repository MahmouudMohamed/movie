import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/category_cubit.dart';
import 'custom_browser_details.dart';
class BrowseDetails extends StatelessWidget {
  const BrowseDetails({super.key});

  static const String routeName = "browse_details";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as dynamic;
    return BlocProvider(
      create: (context) =>
          CategoryCubit()..getBrowseShow(arguments.id.toString()),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is BrowseShowLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
          if (state is BrowseShowErrorState) {
            return const Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (state is BrowseShowSuccessState) {
            return CustomBrowserDetails(arguments: arguments);
          }

          return Container();
        },
      ),
    );
  }
}
