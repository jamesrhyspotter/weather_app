import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AllLocationsViewsController extends GetxController {
  RxList allCities = [].obs;
  RxList searchResults = [].obs;

  onInit() {
    fetchCityData();
  }

  fetchCityData() async {
    final rawData = await rootBundle.loadString("assets/data/worldcities.csv");
    List<List<dynamic>> data = const CsvToListConverter().convert(rawData);

    allCities.value = data;
  }

  updateCityData({required String input}) {
    searchResults.value = allCities.value
        .where(
            (city) => city[0].toLowerCase().contains(formatInput(input: input)))
        .toList();
  }

  resetSearch() {
    searchResults.value = [];
  }

  formatInput({required String input}) {
    return input.removeAllWhitespace.toLowerCase();
  }
}
