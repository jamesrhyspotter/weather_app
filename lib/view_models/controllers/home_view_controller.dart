import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather_app/view_models/services/user_repo.dart';

import '../services/location_service.dart';

class HomeViewController extends GetxController {
  RxInt currentPageIndex = 1.obs;
  RxString locationName = RxString('');
  RxDouble lat = RxDouble(0);
  RxDouble lon = RxDouble(0);
  RxString closestCity = RxString('');
  final LocationService _locationService = LocationService();
  // final UserRepo usrRepo = UserRepo();
  RxList<String> locations = <String>[].obs;
  RxBool isLoading = RxBool(true);
  UserRepo usrRepo = UserRepo();

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

    usrRepo.updateLocationBox(
        location: closestCity.value, lat: lat.value, lon: lon.value);

    isLoading.value = false;
  }

  Future<List<String>> fetchLocations() async {
    List cities = usrRepo.getLocations();
    cities.remove(closestCity.value);
    return [closestCity.value, ...cities];
  }

  List<double> fetchLatLong({required String location}) {
    return usrRepo.getLatLong(location: location) ?? [0, 0];
  }

  updatePageIndex({required int index}) {
    currentPageIndex.value = index;
  }

  toggleRefresh() async {
    isLoading.value = true;
    print(isLoading.value);
    await Future.delayed(const Duration(seconds: 1));
    isLoading.value = false;
    print(isLoading.value);
  }

  @override
  void refresh() async {
    // TODO: implement refresh
    super.refresh();
    isLoading.value = true;
    await Future.delayed(const Duration(microseconds: 1));
    isLoading.value = false;
  }
}
