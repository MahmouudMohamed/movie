import 'package:flutter/material.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => _BookMarkState();
}
bool checkMark = false;


class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            checkMark = !checkMark;
          });
        },
        child: checkMark
            ? Image.asset("assets/images/bookmark.png")
            : Image.asset("assets/images/unbookmark.png"));
  }

}

//import 'package:flutter/material.dart';
//
// class BookMark extends StatefulWidget {
//   const BookMark({super.key});
//
//   @override
//   State<BookMark> createState() => _BookMarkState();
// }  bool checkMark = false;
//
//
// class _BookMarkState extends State<BookMark> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           setState(() {
//             checkMark=!checkMark;
//           });
//         },
//         child: checkMark
//             ? Image.asset("assets/images/bookmark.png")
//             : Image.asset("assets/images/unbookmark.png"));
//   }