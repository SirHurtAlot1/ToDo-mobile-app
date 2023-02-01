import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData iconData;
  final double borderRadius;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  const CircleIconButton(
      {super.key,
      required this.iconData,
      required this.borderRadius,
      this.onPressed,
      this.backgroundColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: borderRadius,
        backgroundColor: backgroundColor,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            color: iconColor,
          ),
        ));
  }
}
