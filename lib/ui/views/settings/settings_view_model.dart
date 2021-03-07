import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:system_settings/system_settings.dart';

class SettingsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void openSettings() async {
    SystemSettings.system();
  }

  void openListOfApps() async {
    _navigationService.navigateTo(Routes.listOfAppsView);
  }
}
