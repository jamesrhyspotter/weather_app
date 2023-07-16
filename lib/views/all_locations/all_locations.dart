import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app/view_models/controllers/all_locations_view_controller.dart';
import 'package:weather_app/view_models/controllers/home_view_controller.dart';
import 'package:weather_app/views/all_locations/widgets/results_list.dart';
import 'package:weather_app/views/all_locations/widgets/search_box.dart';

import '../theme/type_face.dart';

class AllLocations extends StatefulWidget {
  final List<String> locations;
  AllLocations({super.key, required this.locations});

  @override
  State<AllLocations> createState() => _AllLocationsState();
}

class _AllLocationsState extends State<AllLocations> {
  HomeViewController ctrl = Get.find<HomeViewController>();
  AllLocationsViewsController locCtrl = Get.put(AllLocationsViewsController());
  TextEditingController textCtrl = TextEditingController();
  List<String> searchResults = [];

  @override
  Widget build(BuildContext context) {
    locCtrl.onInit();

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        body: locCtrl.isRefreshing.value
            ? const Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SearchBox(
                            controller: textCtrl,
                            onSubmitted: (value) {},
                            onChanged: (value) =>
                                locCtrl.updateSearchResults(input: value)),
                        ResultsList(
                          data: locCtrl.searchResults.isEmpty
                              ? locCtrl.allCities
                              : locCtrl.searchResults,
                          isSelected: locCtrl.selectedLocations
                              .contains(locCtrl.allCities[0][0]),
                          onToggle: (value) {
                            locCtrl.updateSelectedLocations(location: value);
                            print(locCtrl.selectedLocations);
                            print(locCtrl.allCities[0][0]);
                            locCtrl.refresh();
                          },
                        )
                      ],
                    )),
              ),
      ),
    );
  }
}
