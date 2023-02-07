import 'package:flutter/material.dart';
import 'package:todo/widgets/button_with_counter.dart';
import 'package:todo/widgets/cirlce_icon_button.dart';
import 'package:todo/widgets/task_card.dart';
import 'assets/app_colors.dart';

import 'widgets/greeting_card.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  bool isAllTasksBtnActive = true;
  bool isTodayTasksBtnActive = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const GreetingsCard(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.white))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWithCounter(
                            onPress: isAllTasksBtnActive
                                ? () {
                                    setState(() {
                                      isAllTasksBtnActive = false;
                                      isTodayTasksBtnActive = true;
                                    });
                                  }
                                : null,
                            counterData: 20,
                            buttonText: 'All'),
                        ButtonWithCounter(
                            onPress: isTodayTasksBtnActive
                                ? () {
                                    setState(() {
                                      isAllTasksBtnActive = true;
                                      isTodayTasksBtnActive = false;
                                    });
                                  }
                                : null,
                            counterData: 1,
                            buttonText: 'Today')
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: TaskCard(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
