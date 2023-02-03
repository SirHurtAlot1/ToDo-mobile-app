// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class AppColors {
  static _Scaffold scaffold = _Scaffold();
  static _Appbar appbar = _Appbar();
  static _GretingsCard gretingsCard = _GretingsCard();
  static _ButtonWithCounter buttonWithCounter = _ButtonWithCounter();
}

class _Scaffold {
  Color background = const Color(0xff111c2f);
}

class _Appbar {
  Color buttonBackground = const Color(0xff172741);
  Color icon = Colors.white;
}

class _GretingsCard {
  Color greetingsText = const Color(0xff6286dc);
  Color weekDayText = Colors.white;
  Color dateText = Colors.grey;
  Color donePercentText = Colors.white;
  Color completedTasksText = Colors.grey;
}

class _ButtonWithCounter {
  Color counterTextOnFocus = Colors.black;
  Color buttonDescTextOnFocus = const Color(0xff6286dc);
  Color counterTextOffFocus = Colors.grey;
  Color buttonDescTextOffFocus = Colors.grey;
}
