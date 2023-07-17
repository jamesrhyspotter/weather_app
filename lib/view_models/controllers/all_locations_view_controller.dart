import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weather_app/view_models/services/user_repo.dart';

class AllLocationsViewsController extends GetxController {
  RxList allCities = [].obs;
  RxList searchResults = [].obs;
  RxList selectedLocations = [].obs;
  UserRepo usrRepo = UserRepo();
  RxBool isRefreshing = true.obs;

  @override
  onInit() async {
    await fetchCityData();
    await fetchSelectedData();
    refresh();
  }

  fetchCityData() async {
    final rawData = await rootBundle.loadString("assets/data/worldcities.csv");
    List<List<dynamic>> data = const CsvToListConverter().convert(rawData);

    allCities.value = data;
  }

  fetchSelectedData() {
    selectedLocations.value = usrRepo.getLocations();
  }

  updateSearchResults({required String input}) {
    searchResults.value = allCities
        .where(
            (city) => city[0].toLowerCase().contains(formatInput(input: input)))
        .toList();
  }

  updateSelectedLocations(
      {required String location,
      required double lat,
      required double lon}) async {
    await usrRepo.updateLocationBox(location: location, lat: lat, lon: lon);
    selectedLocations.value = usrRepo.getLocations();
    print(selectedLocations);
  }

  resetSearch() {
    searchResults.value = [];
  }

  formatInput({required String input}) {
    return input.removeAllWhitespace.toLowerCase();
  }

  @override
  void refresh() async {
    // TODO: implement refresh
    super.refresh();
    isRefreshing.value = true;
    await Future.delayed(const Duration(microseconds: 1));
    isRefreshing.value = false;
  }
}
