import 'package:flutter/material.dart';
import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'simpleLauncher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
