import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weather_app/view_models/controllers/home_view_controller.dart';
import 'package:weather_app/views/all_locations/all_locations.dart';
import 'package:weather_app/views/weather_view/weather_view.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  final HomeViewController ctrl = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    ctrl.onInit();
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.black,
        body: Stack(alignment: AlignmentDirectional.center, children: [
          ctrl.isLoading.value
              ? const Positioned(top: 0, child: CircularProgressIndicator())
              : const SizedBox(),
          FutureBuilder<List<String>>(
              future: ctrl.fetchLocations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    ctrl.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  var locations = snapshot.data;
                  return CarouselSlider(
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          viewportFraction: 1.0,
                          pageSnapping: true,
                          height: MediaQuery.of(context).size.height),
                      items: [
                        ...locations!
                            .map((loc) =>
                                WeatherView(city: loc, color: Colors.pink))
                            .toList(),
                        AllLocations(locations: locations)
                      ]);
                }

                return const Center(child: Text('Error Retreving data'));
              }),
        ]),
      ),
    );
  }
}
