import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDo {
  @HiveField(0)
  final String taskName;
  @HiveField(1)
  bool isDone = false;

  ToDo({required this.taskName});
}
