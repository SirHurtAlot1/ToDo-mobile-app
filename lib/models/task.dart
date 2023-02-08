import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  bool? isComplete;
  @HiveField(1)
  String taskName;
  @HiveField(2)
  String createDate = DateFormat('dd.MM').format(DateTime.now());
  Task({
    required this.isComplete,
    required this.taskName,
  });
}
