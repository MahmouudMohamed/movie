
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(elevation: 0,backgroundColor: AppColor.appbarColor, centerTitle: true,
        scrolledUnderElevation: 0,
        iconTheme:IconThemeData(color: Colors.white,size: 30) ),
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColor.backgroundColorBottomNavigationBar,
      selectedItemColor: AppColor.selectedItemColorBottomNavigationBar,
      unselectedItemColor: AppColor.unselectedItemColorBottomNavigationBar,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.inter(
          fontSize: 8, color: AppColor.selectedItemColorBottomNavigationBar),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.inter(
        fontSize: 14,
        color: AppColor.bodyLargeText,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 10,
        color: AppColor.bodySmallText,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 10,
        color: AppColor.bodyLargeText,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),



    ),

    cardTheme: const CardTheme(
      color: Colors.transparent,
      elevation: 0,
      clipBehavior: Clip.antiAlias,
    ),

  );

}
