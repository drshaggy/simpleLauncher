import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartUpViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future initialise() async {
    await checkFirstSeen();
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      _navigationService.clearStackAndShow(Routes.homeView);
    } else {
      prefs.setBool('seen', false);
      _navigationService.clearStackAndShow(Routes.setUpView);
    }
  }
}
