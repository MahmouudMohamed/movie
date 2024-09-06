import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowCategory extends StatelessWidget {
  String left;
   RowCategory({super.key,required this.left,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(left,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15)),
      ],
    );
  }
}
