import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:weather_app/view_models/controllers/home_view_controller.dart';
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
  TextEditingController textCtrl = TextEditingController();
  List<String> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SearchBox(
                  controller: textCtrl,
                  onSubmitted: (value) {},
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: widget.locations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            widget.locations[index],
                            style: b1.copyWith(color: Colors.pink),
                          ),
                        );
                      }),
                ),
              ],
            )),
      ),
    );
  }
}
