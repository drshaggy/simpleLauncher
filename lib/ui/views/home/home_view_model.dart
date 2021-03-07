import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/app/app.router.dart';
import 'package:simpleLauncher/services/animation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends BaseViewModel {
  final AnimationService _animationService = locator<AnimationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  int currentPage = 1;
  Application cam;

  final ScrollController pageController = ScrollController();

  void initialise() async {
    List<Application> apps = await getAppList();

    apps.forEach((app) {
      if (app.appName == "Camera") {
        cam = app;
      }
    });

    pageController.addListener(() {
      double ratio =
          pageController.offset / pageController.position.maxScrollExtent;

      var n = 2 * ratio;
      if ((1 - n).isNegative) {
        _animationService.clockOpacity = 0;
      } else {
        _animationService.clockOpacity = 1 - n;
      }
      _animationService.hiddenAppsOpacity = ratio;
      notifyListeners();
      //print("${_animationService.opacity}");
    });
  }

  Future<List<Application>> getAppList() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeSystemApps: true,
      includeAppIcons: true,
    );
    return apps;
  }

  double getHeightOfPage(context) {
    var height = (MediaQuery.of(context).size.height / 3);
    var padding = MediaQuery.of(context).padding;
    return height - padding.top - padding.bottom;
  }

  void openDialer() async {
    await launch('tel:');
  }

  void openCamera() async {
    if (cam != null) {
      await DeviceApps.openApp(cam.packageName);
    } else {
      Fluttertoast.showToast(msg: "No camera app fund");
    }
  }

  void navigateSettings() {
    _navigationService.navigateTo(Routes.settingsView);
  }
}
