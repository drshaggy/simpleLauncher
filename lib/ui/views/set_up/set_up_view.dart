import 'package:flutter/material.dart';
import 'package:simpleLauncher/ui/views/set_up/set_up_view_model.dart';
import 'package:stacked/stacked.dart';

class SetUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetUpViewModel>.reactive(
      builder: (context, model, child) => Container(),
      viewModelBuilder: () => SetUpViewModel(),
    );
  }
}
