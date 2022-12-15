import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:todo_app/datamodel/todo_model.dart';
import 'package:todo_app/ui/ui_helpers/app_colors.dart';
import 'package:todo_app/ui/ui_helpers/assets_path.dart';
import 'package:todo_app/ui/ui_helpers/shared_styles.dart';
import 'package:todo_app/ui/ui_helpers/ui_helpers.dart';
import 'package:todo_app/ui/view/home/home_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/ui/widgets/dumb_widgets/todo_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            bottomOpacity: 0,
            leading: IconButton(
                onPressed: () {
                  model.deleteUserName();
                },
                icon: SvgPicture.asset(
                  kpMenuSvg,
                  color: kcWhite,
                  width: 25,
                )),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  kpSearchSvg,
                  width: 25,
                  color: kcWhite,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  kpAlertSvg,
                  width: 25,
                  color: kcWhite,
                ),
              )
            ],
          ),
          body: Padding(
            padding: appSymmetricEdgePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceSmall,
                Text(
                  "What's up, ${model.userName.toUpperCase()}!",
                  style: ktsWhiteLargeTextStyle,
                ),
                verticalSpaceSmall,
                const Text(
                  "TODAY'S TASKS",
                  style: ktsblueMidumTextStyle,
                ),
                verticalSpaceSmall,
                Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: Hive.box<ToDo>('todo').listenable(),
                      builder: (context, box, _) {
                        final todos = box.values.toList().cast<ToDo>();
                        if (todos.isNotEmpty) {
                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                verticalSpaceTiny,
                            itemBuilder: (BuildContext context, int index) {
                              return ToDoContainer(
                                isChecked: todos[index].isDone,
                                taskName: todos[index].taskName,
                                onChanged: (p0) =>
                                    model.updateTaskDone(index, p0),
                                onPressed: () => model.deleteTask(index),
                              );
                            },
                            itemCount: todos.length,
                          );
                        }
                        return LottieBuilder.asset(
                            "assets/animations/nodata.json");
                      }),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.showTodoDialog(),
            backgroundColor: kcSecondaryColor,
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
