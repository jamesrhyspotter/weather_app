import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather_app/view_models/services/user_repo.dart';

import '../services/location_service.dart';

class HomeViewController extends GetxController {
  List<Color> colors = [Colors.pink, Colors.blue, Colors.orange, Colors.purple];
  RxString locationName = RxString('');
  RxDouble lat = RxDouble(0);
  RxDouble lon = RxDouble(0);
  RxString closestCity = RxString('');
  final LocationService _locationService = LocationService();
  // final UserRepo usrRepo = UserRepo();
  RxList<String> locations = <String>[].obs;
  RxBool isLoading = RxBool(true);

  @override
  onInit() async {
    await initialiseLocationData();
  }

  initialiseLocationData() async {
    final locationData = await _locationService.getLocation();
    lat.value = locationData.latitude!;
    lon.value = locationData.longitude!;
    closestCity.value =
        await _locationService.estimateClosestCity(lat.value, lon.value);

    isLoading.value = false;
  }

  Future<List<String>> fetchLocations() async {
    return [closestCity.value, 'Test'];
  }
}
