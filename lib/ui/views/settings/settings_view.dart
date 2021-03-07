import 'package:simpleLauncher/ui/views/settings/settings_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:simpleLauncher/styles/dark_styles.dart' as styles;

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  FlatButton(
                    onPressed: () => model.openSettings(),
                    child: ListTile(
                      title: Text("System Settings", style: styles.apps),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => model.openListOfApps(),
                    child: ListTile(
                      title: Text("Apps", style: styles.apps),
                    ),
                  ),
                ],
              )),
        ),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
