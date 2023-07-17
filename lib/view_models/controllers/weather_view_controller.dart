import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather_app/view_models/services/location_service.dart';

import '../services/weather_api_service.dart';

class WeatherViewController extends GetxController {
  Timer? _timer;

  RxString locationName = RxString('');
  RxDouble lat = RxDouble(0);
  RxDouble lon = RxDouble(0);
  RxString currentCity = RxString('');

  final WeatherApiService _weatherService = WeatherApiService();

  RxInt refreshDur = 60.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    startAutoRefresh();
  }

  Future<List> fetchWeatherData({required String city, int count = 1}) async {
    List forcast = [];
    try {
      forcast = await _weatherService.fetchWeatherData(
          lat: 38.123, lon: -78.543, count: count);
    } catch (e) {}

    toggleRefreshRate(hasData: forcast.isNotEmpty);

    return forcast;
  }

  void toggleRefreshRate({required bool hasData}) {
    // if we have data, stop searching and refresh every 15 mins
    hasData ? refreshDur.value = 900 : null;
  }

  void startAutoRefresh() {
    stopAutoRefresh(); // Stop existing timer, if any

    var refreshInterval =
        Duration(seconds: refreshDur.value); // Specify the refresh interval
    _timer = Timer.periodic(refreshInterval, (_) {
      fetchWeatherData(
          city: currentCity.value); // Fetch new data at each interval
    });
  }

  void stopAutoRefresh() {
    _timer?.cancel(); // Cancel the timer, if running
  }

  @override
  void onClose() {
    stopAutoRefresh(); // Stop the timer when the controller is closed
    super.onClose();
  }
}
