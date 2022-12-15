// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';
import 'app.locator.dart';

import '../ui/custom_dialogs/add_task_dialog.dart';

enum DialogType {
  addTaskDialog,
}

void setupDialogUi() {
  var dialogService = locator<DialogService>();

  final builders = {
    DialogType.addTaskDialog: (context, DialogRequest request,
            void Function(DialogResponse) completer) =>
        AddTaskDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
