import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/services/data_base_services.dart';
import 'package:todo_app/ui/custom_dialogs/add_task_dialog.dart';
import 'package:todo_app/ui/view/home/home_view.dart';
import 'package:todo_app/ui/view/landing/landing_view.dart';

@StackedApp(
  routes: [MaterialRoute(page: HomeView), MaterialRoute(page: LandingView)],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: DataBaseService),
    LazySingleton(classType: NavigationService)
  ],
  dialogs: [
    StackedDialog(classType: AddTaskDialog),
  ],
)
class $App {}
