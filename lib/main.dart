import 'package:flutter/material.dart';
import 'package:todo/widgets/cirlce_icon_button.dart';
import 'styles.dart' as styles;

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: styles.mainBackgroundColor,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 5),
              child: CircleIconButton(
                iconData: Icons.notifications,
                borderRadius: 30,
                backgroundColor: styles.appbarButtonBackgroundColor,
                iconColor: styles.appbarIconColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, right: 7.5),
              child: CircleIconButton(
                iconData: Icons.dark_mode,
                borderRadius: 30,
                backgroundColor: styles.appbarButtonBackgroundColor,
                iconColor: styles.appbarIconColor,
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 70),
                  child: const Text(
                    'Good\nMorning',
                    style: styles.greetingsTextStyle,
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Today's Monday",
                          style: styles.mainInformationTextStyle,
                        ),
                        Text(
                          'Dec 12, 2022',
                          style: styles.secondInformationTextStyle,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          '75% Done',
                          style: styles.mainInformationTextStyle,
                        ),
                        Text(
                          'Completed Tasks',
                          style: styles.secondInformationTextStyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: const Text('12')),
                            const Text('Tasks')
                          ],
                        )
                      ],
                    ),
                    Column()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
