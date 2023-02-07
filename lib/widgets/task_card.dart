import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('1h 30m'),
              CircleAvatar(
                  backgroundColor: Colors.teal.shade700,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check),
                  ))
            ],
          ),
          Center(
            child: Text('Walk my dog'),
          )
        ],
      ),
    );
  }
}
