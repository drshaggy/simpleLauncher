import 'package:simpleLauncher/ui/views/start_up/home_view_model.dart';
import 'package:simpleLauncher/ui/widgets/dumb/app_drawer.dart';
import 'package:simpleLauncher/ui/widgets/dumb/apps.dart';
import 'package:simpleLauncher/ui/widgets/dumb/apps_hidden.dart';
import 'package:simpleLauncher/ui/widgets/dumb/custom_scroll_behaviour.dart';
import 'package:simpleLauncher/ui/widgets/dumb/custom_scroll_physics.dart';
import 'package:simpleLauncher/ui/widgets/dumb/floating_settings_button.dart';

import 'package:simpleLauncher/ui/widgets/smart/clock_view.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:simpleLauncher/styles/dark_styles.dart' as styles;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(color: Colors.black),
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: ListView(
                physics: CustomScrollPhysics(
                    itemDimension: model.getHeightOfPage(context)),
                controller: model.pageController,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: model.getHeightOfPage(context),
                    child: ClockView(),
                  ),
                  Container(
                    height: model.getHeightOfPage(context),
                    child: Apps(),
                  ),
                  Container(
                    height: model.getHeightOfPage(context),
                    child: AppsHidden(),
                  ),
                  Container(
                    child: SizedBox(height: model.getHeightOfPage(context)),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingSettingsButton(
          onPressed: () => model.navigateSettings(),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.phone),
                onPressed: () => model.openDialer(),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.camera_alt_rounded),
                onPressed: () => model.openCamera(),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
