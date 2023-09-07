// import 'dart:convert';

import 'package:client/MyContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:simple_gesture_detector/simple_gesture_detector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool col2Box = true;
  bool col3Box = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
            child: Row(
              children: [
                MyContainer(visiblity: true),
                
                Visibility(
                  visible: true,
                  child: Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(5, 10, 10, 15),
                      height: MediaQuery.of(context).size.height,
                      // color: Colors.lime,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onVerticalDragUpdate: (details) {
                                int sensitivity = 8;
                                if (details.primaryDelta! > sensitivity) {
                                  // Down Swipe
                                  setState(() {
                                    col3Box = false;
                                  });
                                  print("Down");
                                } else if (details.primaryDelta! < -sensitivity) {
                                  // Up Swipe
                                  setState(() {
                                    col3Box = true;
                                  });
                                  print("Up");
                                }
                                print(col3Box);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: !col3Box
                                    ? 200
                                    : MediaQuery.of(context).size.height - 235,
                                width: double.infinity,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onVerticalDragUpdate: (details) {
                                int sensitivity = 8;
                                if (details.primaryDelta! > sensitivity) {
                                  // Down Swipe
                                  setState(() {
                                    col3Box = false;
                                  });
                                  print("Down");
                                } else if (details.primaryDelta! < -sensitivity) {
                                  // Up Swipe
                                  setState(() {
                                    col3Box = true;
                                  });
                                  print("Up");
                                }
                                print(details.primaryDelta!);
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: col3Box
                                    ? 200
                                    : MediaQuery.of(context).size.height - 235,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
