import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/database.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/button_with_counter.dart';
import 'package:todo/widgets/cirlce_icon_button.dart';
import 'package:todo/widgets/dialog_box.dart';
import 'package:todo/widgets/task_card.dart';
import 'assets/app_colors.dart';

import 'widgets/greeting_card.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

  await Hive.openBox('tasks');
  runApp(const MaterialApp(home: ToDo()));
}

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  final TextEditingController controller = TextEditingController();
  TasksDatabase db = TasksDatabase();

  bool isAllTasksBtnActive = true;
  bool isTodayTasksBtnActive = false;

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          onSave: () => saveTask(),
          onCansel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  void onCheckBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index].isComplete = !db.toDoList[index].isComplete!;
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.toDoList.add(Task(isComplete: false, taskName: controller.text));
      controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  @override
  void initState() {
    if (db.box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(),
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
                      border: Border(bottom: BorderSide(color: Colors.white))),
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
                itemCount: db.toDoList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TaskCard(
                      task: db.toDoList[index],
                      onDelete: (context) => deleteTask(index),
                      onCheckBoxChange: (value) =>
                          onCheckBoxChanged(value, index),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
