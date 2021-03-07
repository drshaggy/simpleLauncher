import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:simpleLauncher/styles/dark_styles.dart' as styles;
import 'package:simpleLauncher/ui/widgets/smart/clock_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ClockView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClockViewModel>.reactive(
      onModelReady: (model) => model.initialise(),
      builder: (context, model, child) => AnimatedOpacity(
        opacity: model.getOpacity(),
        duration: Duration(microseconds: 1),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: CircularPercentIndicator(
            progressColor: Colors.white,
            backgroundColor: Colors.white10,
            percent: model.batteryLevel,
            lineWidth: 3,
            radius: 149,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${model.getSystemTime()}", style: styles.time),
                Text("${model.getSystemDate()}", style: styles.date),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ClockViewModel(),
    );
  }
}
