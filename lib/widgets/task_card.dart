import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/models/task.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final Function(bool?)? onCheckBoxChange;
  final Function(BuildContext)? onDelete;
  const TaskCard(
      {super.key,
      required this.task,
      required this.onCheckBoxChange,
      required this.onDelete});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(15),
          onPressed: widget.onDelete,
          icon: Icons.delete,
        )
      ]),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.task.taskName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20,
                    decoration: widget.task.isComplete!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ),
            Row(
              children: [
                Text('${widget.task.createDate}'),
                Checkbox(
                    value: widget.task.isComplete!,
                    onChanged: widget.onCheckBoxChange)
              ],
            )
          ],
        ),
      ),
    );
  }
}
