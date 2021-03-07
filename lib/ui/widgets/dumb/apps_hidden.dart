import 'package:flutter/material.dart';
import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/services/animation_service.dart';
import 'package:simpleLauncher/styles/dark_styles.dart' as styles;

class AppsHidden extends StatelessWidget {
  final AnimationService _animationService = locator<AnimationService>();

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _animationService.hiddenAppsOpacity,
      duration: Duration(microseconds: 1),
      child: IgnorePointer(
        child: ListView(
          children: [
            ListTile(title: Text("App 5", style: styles.apps)),
            ListTile(title: Text("App 6", style: styles.apps)),
            ListTile(title: Text("App 7", style: styles.apps)),
            ListTile(title: Text("App 8", style: styles.apps)),
          ],
        ),
      ),
    );
  }
}
