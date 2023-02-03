import 'package:flutter/material.dart';
import 'package:todo/assets/app_text_styles.dart';

class GreetingsCard extends StatelessWidget {
  const GreetingsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 70),
            child: Text(
              'Good\nMorning',
              style: TextStyles.gretingsCard.greetingsText,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Monday",
                    style: TextStyles.gretingsCard.weekDayText,
                  ),
                  Text(
                    'Dec 12, 2022',
                    style: TextStyles.gretingsCard.dateText,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '75% Done',
                    style: TextStyles.gretingsCard.donePercentText,
                  ),
                  Text(
                    'Completed Tasks',
                    style: TextStyles.gretingsCard.completedTasksText,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
