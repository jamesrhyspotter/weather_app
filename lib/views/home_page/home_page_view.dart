import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:weather_app/view_models/controllers/home_view_controller.dart';
import 'package:weather_app/views/all_locations/all_locations.dart';
import 'package:weather_app/views/home_page/widgets/page_indicator.dart';
import 'package:weather_app/views/weather_view/weather_view.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  final HomeViewController ctrl = Get.put(HomeViewController());
  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    ctrl.onInit();
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<String>>(
          future: ctrl.fetchLocations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              var locations = snapshot.data;
              return Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            ctrl.updatePageIndex(index: index);
                          },
                          enableInfiniteScroll: false,
                          viewportFraction: 1.0,
                          initialPage: 1,
                          pageSnapping: true,
                          height: MediaQuery.of(context).size.height),
                      items: [
                        AllLocations(locations: locations!),
                        ...locations
                            .map((loc) => WeatherView(
                                location: loc,
                                lat: 0,
                                lon: 0,
                                color: Colors.pink))
                            .toList(),
                      ]),
                  Obx(
                    () => Positioned(
                        top: 35,
                        child: PageIndicator(
                          index: ctrl.currentPageIndex.value,
                          itemCount: locations.length + 1,
                        )),
                  )
                ],
              );
            }

            return const Center(child: Text('Error Retreving data'));
          }),
    );
  }
}
