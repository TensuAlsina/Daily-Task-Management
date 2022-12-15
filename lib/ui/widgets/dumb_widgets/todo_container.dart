import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../ui_helpers/assets_path.dart';
import '../../ui_helpers/shared_styles.dart';

class ToDoContainer extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  final Function()? onPressed;
  final Function(bool?)? onChanged;
  const ToDoContainer({
    Key? key,
    this.onPressed,
    required this.isChecked,
    required this.taskName,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: kbdToDoContainerDecoration,
      child: Row(
        children: [
          Checkbox(
            fillColor: isChecked
                ? const MaterialStatePropertyAll(Colors.green)
                : const MaterialStatePropertyAll(Color(0xFFEB06FF)),
            value: isChecked,
            onChanged: onChanged,
            shape: const CircleBorder(),
          ),
          // const SizedBox(
          //   width: 15,
          // ),
          Expanded(
            child: Text(
              taskName,
              style: ktsTaskNameTextStyle(isChecked),
            ),
          ),

          IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              kpDeleteSvg,
              width: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
