import 'package:simpleLauncher/styles/dark_styles.dart' as styles;
import 'package:simpleLauncher/ui/widgets/smart/clock_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

class ClockView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClockViewModel>.reactive(
      builder: (context, model, child) => AnimatedOpacity(
        opacity: model.getOpacity(),
        duration: Duration(microseconds: 1),
        child: Padding(
          padding: EdgeInsets.all(40),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: styles.textColor, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${model.getSystemTime()}", style: styles.time),
                Text("${model.getSystemDate()}", style: styles.date),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ClockViewModel(),
    );
  }
}
