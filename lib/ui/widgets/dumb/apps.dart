import 'package:flutter/material.dart';
import 'package:simpleLauncher/styles/dark_styles.dart' as styles;

class Apps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: ListView(
        children: [
          ListTile(title: Text("App 1", style: styles.apps)),
          ListTile(title: Text("App 2", style: styles.apps)),
          ListTile(title: Text("App 3", style: styles.apps)),
          ListTile(title: Text("App 4", style: styles.apps)),
        ],
      ),
    );
  }
}
