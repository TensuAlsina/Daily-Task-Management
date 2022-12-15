import 'package:hive/hive.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.dialog.dart';
import 'package:todo_app/services/data_base_services.dart';

import '../../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final DataBaseService _dataBaseService = locator<DataBaseService>();

  final String _userName = Hive.box('user').get('userName');
  String get userName => _userName;

  Future showTodoDialog() async {
    DialogResponse<dynamic>? response = await _dialogService.showCustomDialog(
        variant: DialogType.addTaskDialog,
        title: "Add New Task",
        showIconInMainButton: true,
        barrierDismissible: true);
    if (response?.data != null) addNewTaskToDataBase(response!.data);
    return;
  }

  addNewTaskToDataBase(String newTask) {
    _dataBaseService.addNewTask(newTask);
  }

  deleteTask(int index) {
    _dataBaseService.deleteTaskByIndex(index);
  }

  updateTaskDone(int index, bool? p0) {
    _dataBaseService.changeisDone(index, p0);
  }

  void deleteUserName() async {
    await Hive.box('user').put('userName', null);
    print("Done");
  }
}
