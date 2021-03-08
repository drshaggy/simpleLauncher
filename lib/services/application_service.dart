import 'package:device_apps/device_apps.dart';
import 'package:simpleLauncher/models/app.dart';

class ApplicationService {
  Future<List<App>> getAppList() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      onlyAppsWithLaunchIntent: true,
      includeSystemApps: true,
      includeAppIcons: true,
    );
    List<App> newApps = [];
    apps.forEach(
      (app) {
        newApps.add(
          App(app),
        );
      },
    );
    return newApps;
  }
}
