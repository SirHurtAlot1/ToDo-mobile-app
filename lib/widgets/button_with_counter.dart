// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonWithCounter extends StatefulWidget {
  final VoidCallback? onPress;
  final int counterData;
  final String buttonText;
  const ButtonWithCounter(
      {super.key,
      required this.onPress,
      required this.counterData,
      required this.buttonText});

  @override
  State<ButtonWithCounter> createState() => _ButtonWithCounterState();
}

class _ButtonWithCounterState extends State<ButtonWithCounter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        TextButton(
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: widget.onPress,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Text(
                          widget.counterData.toString(),
                          style: TextStyle(fontSize: 15),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      widget.buttonText,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ),
                ]))
      ],
    );
  }
}
