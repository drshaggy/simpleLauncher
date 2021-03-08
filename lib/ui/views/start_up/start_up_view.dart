import 'package:flutter/material.dart';
import 'package:simpleLauncher/ui/views/start_up/start_up_view_model.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
