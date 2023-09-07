// import 'package:flutter/material.dart';

// class AnimatedColumn extends StatefulWidget {
//   bool conatainerSize;
//   AnimatedColumn({super.key, required this.conatainerSize});

//   @override
//   State<AnimatedColumn> createState() => _AnimatedColumnState();
// }

// class _AnimatedColumnState extends State<AnimatedColumn> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//                   visible: true,
//                   child: Expanded(
//                     child: Container(
//                       margin: const EdgeInsets.fromLTRB(5, 10, 5, 15),
//                       height: MediaQuery.of(context).size.height,
//                       // color: Colors.lime,
//                       child: SingleChildScrollView(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             GestureDetector(
//                               onVerticalDragUpdate: (details) {
//                                 int sensitivity = 8;
//                                 if (details.primaryDelta! > sensitivity) {
//                                   // Down Swipe
//                                   setState(() {
//                                      = false;
//                                   });
//                                   print("Down");
//                                 } else if (details.primaryDelta! < -sensitivity) {
//                                   // Up Swipe
//                                   setState(() {
//                                     col2Box = true;
//                                   });
//                                   print("Up");
//                                 }
//                                 print(col2Box);
//                               },
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 200),
//                                 height: !col2Box
//                                     ? 200
//                                     : MediaQuery.of(context).size.height - 235,
//                                 width: double.infinity,
//                                 margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
//                                 decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10),
//                                   ),
//                                   color: Colors.amber,
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onVerticalDragUpdate: (details) {
//                                 int sensitivity = 8;
//                                 if (details.primaryDelta! > sensitivity) {
//                                   // Down Swipe
//                                   setState(() {
//                                     col2Box = false;
//                                   });
//                                   print("Down");
//                                 } else if (details.primaryDelta! < -sensitivity) {
//                                   // Up Swipe
//                                   setState(() {
//                                     col2Box = true;
//                                   });
//                                   print("Up");
//                                 }
//                                 print(details.primaryDelta!);
//                               },
//                               child: AnimatedContainer(
//                                 duration: const Duration(milliseconds: 200),
//                                 height: col2Box
//                                     ? 200
//                                     : MediaQuery.of(context).size.height - 235,
//                                 width: double.infinity,
//                                 decoration: const BoxDecoration(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10),
//                                   ),
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//   }
// }