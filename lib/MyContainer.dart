import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  bool visiblity;
  MyContainer({super.key, required this.visiblity});

  @override
  Widget build(BuildContext context) {
    return Visibility(
                  visible: visiblity,
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 5, 15),
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
  }
}