import 'package:simpleLauncher/services/animation_service.dart';
import 'package:simpleLauncher/ui/views/list_of_apps/list_of_apps_view.dart';
import 'package:simpleLauncher/ui/views/settings/settings_view.dart';
import 'package:simpleLauncher/ui/views/start_up/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: SettingsView),
    MaterialRoute(page: ListOfAppsView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AnimationService)
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}

// Run the following command to generate routes and register services

// flutter pub run build_runner build --delete-conflicting-outputs
