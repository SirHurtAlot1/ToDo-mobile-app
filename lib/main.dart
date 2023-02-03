import 'package:flutter/material.dart';
import 'package:todo/widgets/cirlce_icon_button.dart';
import 'assets/app_colors.dart';
import 'views/button_with_counter.dart';
import 'views/list_switch_panel.dart';
import 'widgets/greeting_card.dart';

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
        backgroundColor: AppColors.scaffold.background,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: CircleIconButton(
                iconData: Icons.notifications,
                borderRadius: 30,
                backgroundColor: AppColors.appbar.buttonBackground,
                iconColor: AppColors.appbar.icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 7.5),
              child: CircleIconButton(
                iconData: Icons.dark_mode,
                borderRadius: 30,
                backgroundColor: AppColors.appbar.buttonBackground,
                iconColor: AppColors.appbar.icon,
              ),
            )
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const GreetingsCard(),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListSwitchPanel(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
