import 'package:flutter/material.dart';
import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/services/animation_service.dart';

class FloatingSettingsButton extends StatelessWidget {
  final AnimationService _animationService = locator<AnimationService>();
  final Function onPressed;

  FloatingSettingsButton({@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget button = AnimatedOpacity(
      opacity: _animationService.hiddenAppsOpacity,
      duration: Duration(microseconds: 1),
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: onPressed,
        child: Icon(
          Icons.settings,
          color: Colors.black,
          size: 30,
        ),
      ),
    );

    if (_animationService.hiddenAppsOpacity == 1) {
      return button;
    } else {
      return IgnorePointer(child: button);
    }
  }
}
