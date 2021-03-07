// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/list_of_apps/list_of_apps_view.dart';
import '../ui/views/set_up/set_up_view.dart';
import '../ui/views/settings/settings_view.dart';
import '../ui/views/start_up/start_up_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String setUpView = '/set-up-view';
  static const String homeView = '/home-view';
  static const String settingsView = '/settings-view';
  static const String listOfAppsView = '/list-of-apps-view';
  static const all = <String>{
    startUpView,
    setUpView,
    homeView,
    settingsView,
    listOfAppsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.setUpView, page: SetUpView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.listOfAppsView, page: ListOfAppsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    SetUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SetUpView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
      );
    },
    ListOfAppsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ListOfAppsView(),
        settings: data,
      );
    },
  };
}
