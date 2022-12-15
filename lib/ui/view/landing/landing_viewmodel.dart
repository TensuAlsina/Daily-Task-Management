import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:todo_app/app/app.locator.dart';
import 'package:todo_app/app/app.router.dart';
import 'package:todo_app/services/data_base_services.dart';

class LandingViewModel extends BaseViewModel {
  final DataBaseService _dataBaseService = locator<DataBaseService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void registerUserName(String name) async {
    await _dataBaseService.registerNewUser(name);
    navigateToHomePage();
  }

  Future<void> navigateToHomePage() async {
    await _navigationService.navigateTo(Routes.homeView);
  }
}
