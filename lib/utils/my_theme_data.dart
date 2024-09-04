
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(elevation: 0,backgroundColor: AppColor.appbarColor, centerTitle: true,
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
  );

// static ThemeData darkTheme = ThemeData(
//  iconTheme: IconThemeData(color: yellowColor),
//   primaryColor: primaryDarkColor,
//
//     iconButtonTheme: IconButtonThemeData(
//         style: ButtonStyle(
//             iconColor:WidgetStatePropertyAll(yellowColor),
//             iconSize:WidgetStatePropertyAll(50),
//             overlayColor: WidgetStateColor.transparent
//         )
//     ),
//   scaffoldBackgroundColor: Colors.transparent,
//   appBarTheme: AppBarTheme(
//     iconTheme: IconThemeData(size: 30, color: Colors.white),
//     backgroundColor: Colors.transparent,
//     centerTitle: true,
//     elevation: 0,
//     scrolledUnderElevation: 0,
//     titleTextStyle: GoogleFonts.elMessiri(
//         fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: primaryDarkColor,
//     selectedItemColor: yellowColor,
//     unselectedItemColor: Colors.white,
//     showUnselectedLabels: false,
//     type: BottomNavigationBarType.fixed,
//       selectedLabelStyle: TextStyle(fontWeight: FontWeight.w900,)
//   ),
//     textTheme: TextTheme(
//         bodyLarge: GoogleFonts.elMessiri(
//             fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
//         bodyMedium: GoogleFonts.elMessiri(
//             fontSize: 25, color: Colors.white, fontWeight: FontWeight.w600),
//         bodySmall: GoogleFonts.elMessiri(
//             fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
//         displayLarge: GoogleFonts.inder(
//             fontWeight: FontWeight.w400, fontSize: 30, color: yellowColor),
//         displayMedium: GoogleFonts.inder(
//             fontWeight: FontWeight.w400, fontSize: 28, color: yellowColor)),
//     dividerTheme: DividerThemeData(
//         color: yellowColor,
//         thickness: 3
//     ),
//   cardTheme: CardTheme(
//     margin: EdgeInsets.symmetric(horizontal: 24,vertical: 30),
//     color: Color(0xff141A2E),
//     elevation: 0,
//     shape: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25),
//         borderSide: BorderSide(color: Colors.transparent)),
//   ),
//     bottomSheetTheme: BottomSheetThemeData(
//     backgroundColor:primaryDarkColor,
// ),
//
// );
}
