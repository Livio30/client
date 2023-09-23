
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  bool mainConnected = false;
  List<bool> widgetFs = [
    false,
    false,
  ];
  double rightWidgetWidth = 300;
  double leftWidgetWidth = 300;
  Duration animationDelay = const Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    double height = 360;
    double width = 869.5;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: width,
            height: height,
            color: Colors.black,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 11.5, 14),
                  child: AnimatedContainer(
                    duration: animationDelay,
                    width: 655,
                    height: 332,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: (widgetFs[0] ||widgetFs[1])
                              ? const EdgeInsets.all(0)
                              : const EdgeInsets.fromLTRB(20, 16, 7.5, 16),
                          child: GestureDetector(
                            onHorizontalDragEnd: (details) {
                              int sensi = 500;
                              double velocity = details.primaryVelocity!;
                              if (velocity > sensi) {
                                print('Right');
                                setState(() {
                                  leftWidgetWidth = 655;
                                  rightWidgetWidth = 0;
                                  widgetFs[0] = true;
                                });
                              } else if (velocity < -sensi) {
                                print('Left');
                                setState(() {
                                  leftWidgetWidth = 300;
                                });
                                Timer(const Duration(milliseconds: 50), () {
                                  setState(() {
                                    widgetFs[0] = false;
                                    rightWidgetWidth = 300;
                                  });
                                },);
                              }
                            },
                            child: AnimatedContainer(
                              duration: animationDelay,
                              width: leftWidgetWidth,
                              height: widgetFs[0] ? 332 : 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: AnimatedCrossFade(firstChild: SvgPicture.asset('images/tripInfoMd.svg'), secondChild: Image.asset('images/tripInfoLg.png'), crossFadeState: widgetFs[0]? CrossFadeState.showSecond:CrossFadeState.showFirst, duration: animationDelay),
                            ),
                          ),
                        ),
                        Padding(
                          padding: (widgetFs[0] ||widgetFs[1])
                              ? const EdgeInsets.all(0)
                              : const EdgeInsets.fromLTRB(7.5, 16, 20, 16),
                          child: GestureDetector(
                            onHorizontalDragEnd: (details) {
                              int sensi = 500;
                              double velocity = details.primaryVelocity!;
                              if (velocity > sensi) {
                                print('Right');

                                setState(() {
                                  rightWidgetWidth = 300;
                                });
                                Timer(const Duration(milliseconds: 50), () {
                                  setState(() {
                                    widgetFs[1] = false;
                                    leftWidgetWidth = 300;
                                  });
                                });
                              } else if (velocity < -sensi) {
                                print('Left');
                                setState(() {
                                  rightWidgetWidth = 655;
                                  leftWidgetWidth = 0;
                                  widgetFs[1] = true;
                                });
                              }
                            },
                            child: AnimatedContainer(
                              duration: animationDelay,
                              width: rightWidgetWidth,
                              height: widgetFs[1]?332:300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                
                              ),
                              child: AnimatedCrossFade(firstChild: SvgPicture.asset('images/weatherMd.svg'), secondChild: Image.asset('images/weatherLg.png'), crossFadeState: widgetFs[1]? CrossFadeState.showSecond:CrossFadeState.showFirst, duration: animationDelay),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.5, 14, 20, 14),
                  child: Container(
                    width: 150,
                    height: 332,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics:(widgetFs[0] ||widgetFs[1])?const AlwaysScrollableScrollPhysics(): const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 14),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.amber,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 14),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 6, 0, 14),
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.cyan,
                              ),
                            ),
                          ),
                        ],
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
