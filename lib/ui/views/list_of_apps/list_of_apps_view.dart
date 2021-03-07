import 'package:simpleLauncher/ui/views/list_of_apps/list_of_apps_view_model.dart';
import 'package:simpleLauncher/ui/widgets/dumb/app_drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ListOfAppsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ListOfAppsViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: Colors.black,
          child: AppDrawer(model.getAppList()),
        ),
      ),
      viewModelBuilder: () => ListOfAppsViewModel(),
    );
  }
}
