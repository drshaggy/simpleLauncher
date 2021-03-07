import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:simpleLauncher/styles/dark_styles.dart' as styles;

class AppDrawer extends StatelessWidget {
  final Future future;

  const AppDrawer(this.future);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          return Container();
        }
        print("${snapshot.data}");
        List<Application> apps = snapshot.data;
        if (apps != null) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: apps?.length,
            itemBuilder: (context, index) {
              Application app = apps[index];
              return FlatButton(
                onPressed: () => DeviceApps.openApp(app.packageName),
                child: ListTile(
                  title: Text('${app.appName}', style: styles.apps),
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
