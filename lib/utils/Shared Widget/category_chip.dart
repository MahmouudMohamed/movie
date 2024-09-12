import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatelessWidget {
  String text;
  CategoryChip({required this.text,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
        width: 80,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)
      ),
      child: Padding(padding: const EdgeInsets.all(5),
          child: Center(child: Text(text,style: GoogleFonts.inter(fontSize: 10,fontWeight: FontWeight.w400,color:Colors.white,))),
    )
    );

  }
}