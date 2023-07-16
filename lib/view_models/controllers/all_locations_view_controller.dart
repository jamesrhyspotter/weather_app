import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AllLocationsViewsController extends GetxController {
  loadCSV() async {
    final _rawData = await rootBundle.loadString("assets/data/worldcities.csv");
  }
}
