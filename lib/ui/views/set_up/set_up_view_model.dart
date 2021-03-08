import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/app/app.router.dart';
import 'package:simpleLauncher/models/app.dart';
import 'package:simpleLauncher/services/application_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetUpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final ApplicationService _applicationService = ApplicationService();
  final PageController pageController = PageController();
  int currentPage = 0;
  int numberOfSelected = 0;
  List<App> apps = [];
  bool permissionsGranted = false;

  void initialise() async {
    apps = await getApplications();
  }

  void onPageChanged(int page) {
    currentPage = page;
    notifyListeners();
  }

  void onAppSelected(int index) {
    bool selected = apps[index].selected == false;
    if ((numberOfSelected != 8) | (selected == false)) {
      apps[index].selected = selected;
      if (selected) {
        numberOfSelected++;
      } else {
        numberOfSelected--;
      }
    }
    notifyListeners();
  }

  Future<List<App>> getApplications() async {
    return await _applicationService.getAppList();
  }

  Widget generateFloatingButton() {
    if (numberOfSelected > 0 && numberOfSelected < 8) {
      return IgnorePointer(
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () => null,
          child: Text("$numberOfSelected/8"),
        ),
      );
    } else if (numberOfSelected == 8) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => nextStep(),
        child: Icon(Icons.arrow_forward),
      );
    } else if (numberOfSelected == 9 && permissionsGranted) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => navigateToHome(),
        child: Icon(Icons.arrow_forward),
      );
    }
    return null;
  }

  void nextStep() {
    numberOfSelected++;
    print("next step pressed");
    pageController.nextPage(
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  Future<void> requestPermissions() async {
    permissionsGranted = true;
    notifyListeners();
  }

  void navigateToHome() {
    _navigationService.clearStackAndShow(Routes.homeView);
  }
}
