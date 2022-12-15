import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/ui/ui_helpers/app_colors.dart';
import 'package:todo_app/ui/ui_helpers/shared_styles.dart';
import 'package:todo_app/ui/ui_helpers/ui_helpers.dart';

class AddTaskDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const AddTaskDialog(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: _MyDialogContainer(request: request, completer: completer),
    );
  }
}

class _MyDialogContainer extends HookWidget {
  const _MyDialogContainer({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function(DialogResponse p1) completer;

  @override
  Widget build(BuildContext context) {
    var textController = useTextEditingController();
    return Container(
      decoration: kbdAddTaskDialogContainerDecoration,
      child: Padding(
        padding: customDialogPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              request.title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
            verticalSpaceTiny,
            TextField(
              controller: textController,
              style: const TextStyle(
                color: kcWhite,
              ),
            ),
            verticalSpaceTiny,
            ElevatedButton(
              onPressed: () {
                completer(DialogResponse(data: textController.text));
              },
              style: kbtsAddToDoButtonStyle,
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
