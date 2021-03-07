import 'package:device_apps/device_apps.dart';
import 'package:stacked/stacked.dart';

class ListOfAppsViewModel extends BaseViewModel {
  Future<List<Application>> getAppList() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeSystemApps: true,
      includeAppIcons: true,
    );
    return apps;
  }
}
