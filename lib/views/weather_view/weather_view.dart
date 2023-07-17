import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view_models/controllers/weather_view_controller.dart';
import 'package:weather_app/views/theme/type_face.dart';
import 'package:weather_app/views/weather_view/widgets/date_widget.dart';
import 'package:weather_app/views/weather_view/widgets/forecast_widget.dart';
import 'package:weather_app/views/weather_view/widgets/info_icon.dart';

import 'widgets/location_widget.dart';

class WeatherView extends StatelessWidget {
  final String location;
  final double lat;
  final double lon;
  final Color color;
  WeatherView(
      {super.key,
      required this.location,
      required this.lat,
      required this.lon,
      required this.color});
  final WeatherViewController ctrl = Get.put(WeatherViewController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: ctrl.fetchWeatherData(city: location, lat: lat, lon: lon),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final List<dynamic>? weatherData = snapshot.data;
          return Scaffold(
            backgroundColor: color,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                              'assets/icons/${weatherData![0].icon}.png'),
                        ),
                        LocationWidget(location: location),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: DateWidget(
                    color: color,
                  )),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                        child: Text(
                      '${weatherData![0].description}',
                      style: b1,
                    )),
                  ),
                  SliverToBoxAdapter(
                    child: DelayedDisplay(
                      fadingDuration: const Duration(milliseconds: 250),
                      slidingBeginOffset: const Offset(-5, 0),
                      child: SizedBox(
                        height: 150,
                        width: 100,
                        child: Center(
                            child: Text('${weatherData![0].temp}°', style: h1)),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 120,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daily Summary',
                            style: h3,
                          ),
                          Text(
                            'Today\'s max temp will be ${weatherData![0].maxTemp} and feels like  ${weatherData![0].appMaxTemp}.',
                            style: b2,
                            overflow: TextOverflow.visible,
                          ),
                          Text(
                            'UV Index: ${weatherData![0].uv}',
                            style: b2,
                          ),
                          Text(
                            'Lowest temp will be ${weatherData![0].minTemp} and feels like ${weatherData![0].appMinTemp}.',
                            style: b2,
                          ),
                          Text(
                            'There is a  ${weatherData![0].pop}% chance of rain, estimating ${weatherData![0].precip}mm of rainfall',
                            style: b2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InfoIcon(
                              item: 'Wind',
                              value: '${weatherData![0].windSpd}mph',
                              icon: Icons.wind_power_outlined,
                              color: color),
                          InfoIcon(
                              item: 'Humidity',
                              value: '${weatherData![0].rh}%',
                              icon: Icons.water_drop_outlined,
                              color: color),
                          InfoIcon(
                              item: 'Visibility',
                              value: '${weatherData![0].vis}km',
                              icon: Icons.remove_red_eye_outlined,
                              color: color)
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: SizedBox(
                    height: 170,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Weekly Forecast',
                          style: h3,
                        ),
                        SizedBox(
                          height: 120,
                          child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return DelayedDisplay(
                                    delay:
                                        Duration(milliseconds: (250 * index)),
                                    child: ForecastWidget(
                                      date: DateTime.now()
                                          .add(Duration(days: index + 1)),
                                      iconName: weatherData[index + 1].icon,
                                      data1:
                                          '${weatherData[index + 1].maxTemp}°',
                                      data2:
                                          '${weatherData[index + 1].minTemp}°',
                                    ));
                              }),
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: Text('Unknown Error'));
        }
      },
    );
  }
}
