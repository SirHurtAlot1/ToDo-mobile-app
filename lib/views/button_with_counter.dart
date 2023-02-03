import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class ButtonWithCounter extends StatefulWidget {
  final String buttonText;
  final int counterData;
  VoidCallback onTap;
  bool isDisabled = true;

  ButtonWithCounter(
      {Key? key,
      required this.buttonText,
      required this.counterData,
      required this.onTap})
      : super(key: key);

  @override
  State<ButtonWithCounter> createState() => _ButtonWithCounterState();
}

class _ButtonWithCounterState extends State<ButtonWithCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: widget.isDisabled ? Colors.white : Colors.grey),
                borderRadius: BorderRadius.circular(30),
                color: widget.isDisabled ? Colors.white : Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                widget.counterData.toString(),
                style: TextStyle(
                    fontSize: 15,
                    color: widget.isDisabled
                        ? AppColors.buttonWithCounter.counterTextOnFocus
                        : AppColors.buttonWithCounter.counterTextOffFocus),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
              text: TextSpan(
                  text: widget.buttonText,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: widget.isDisabled
                          ? AppColors.buttonWithCounter.buttonDescTextOnFocus
                          : AppColors.buttonWithCounter.buttonDescTextOffFocus),
                  recognizer: TapGestureRecognizer()..onTap = widget.onTap)),
        )
      ],
    );
  }
}
