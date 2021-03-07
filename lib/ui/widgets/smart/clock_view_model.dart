import 'package:battery/battery.dart';
import 'package:date_format/date_format.dart';
import 'package:simpleLauncher/app/app.locator.dart';
import 'package:simpleLauncher/services/animation_service.dart';
import 'package:stacked/stacked.dart';

class ClockViewModel extends BaseViewModel {
  final AnimationService _animationService = locator<AnimationService>();
  var _battery = Battery();
  double batteryLevel = 1;

  void initialise() async {
    updateBatteryLevel();
  }

  String getSystemTime() {
    var now = DateTime.now();
    return formatDate(now, [HH, ':', nn]);
  }

  String getSystemDate() {
    var now = DateTime.now();
    return formatDate(now, [d, ' ', M, ', ', yyyy]);
  }

  double getOpacity() {
    //print("${_animationService.clockOpacity}");
    return _animationService.clockOpacity;
  }

  void updateBatteryLevel() async {
    batteryLevel = await _battery.batteryLevel / 100;
    print("Battery Level: $batteryLevel");
    notifyListeners();
  }
}
