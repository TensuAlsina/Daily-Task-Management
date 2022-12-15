import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/datamodel/todo_model.dart';

class DataBaseService {
  final _todoBox = Hive.box<ToDo>('todo');
  final _userBox = Hive.box("user");

  void addNewTask(String newTask) async {
    await _todoBox.add(ToDo(taskName: newTask));
  }

  void changeisDone(int index, bool? p0) {
    _todoBox.putAt(
        index, ToDo(taskName: _todoBox.getAt(index)!.taskName)..isDone = p0!);
  }

  void deleteTaskByIndex(int index) {
    _todoBox.deleteAt(index);
  }

  Future<void> registerNewUser(String name) async {
    await _userBox.put("userName", name);
  }
}
