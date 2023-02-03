// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {
  static _GretingsCard gretingsCard = _GretingsCard();
}

class _GretingsCard {
  TextStyle greetingsText = TextStyle(
      color: AppColors.gretingsCard.greetingsText,
      fontSize: 60,
      fontWeight: FontWeight.normal);
  TextStyle weekDayText =
      TextStyle(color: AppColors.gretingsCard.weekDayText, fontSize: 15);
  TextStyle dateText =
      TextStyle(color: AppColors.gretingsCard.dateText, fontSize: 12);
  TextStyle donePercentText =
      TextStyle(color: AppColors.gretingsCard.donePercentText, fontSize: 15);
  TextStyle completedTasksText =
      TextStyle(color: AppColors.gretingsCard.completedTasksText, fontSize: 12);
}
