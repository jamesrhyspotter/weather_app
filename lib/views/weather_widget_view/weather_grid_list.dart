// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:weather_app/views/weather_widget_view/widgets/weather_tile.dart';

// import '../../models/weather_model.dart';
// import '../../view_models/controllers/weather_view_controller.dart';

// class WeatherGridList extends StatelessWidget {
//   final WeatherViewController weatherController =
//       Get.put(WeatherViewController());

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: FutureBuilder<WeatherModel>(
//         future: weatherController.fetchWeatherData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final weather = snapshot.data!;
//             return GridView.count(
//               crossAxisCount: 2,
//               childAspectRatio: 1.5,
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//               padding: const EdgeInsets.all(10.0),
//               children: [
//                 WeatherTile(title: 'Location', data: weather.location),
//                 WeatherTile(
//                     title: 'Temperature',
//                     data: '${weather.temperature.toStringAsFixed(1)}°C'),
//                 WeatherTile(
//                     title: 'Feels Like',
//                     data: '${weather.tempFeelsLike.toStringAsFixed(1)}°C'),
//                 WeatherTile(
//                     title: 'Min Temp',
//                     data: '${weather.tempMin.toStringAsFixed(1)}°C'),
//                 WeatherTile(
//                     title: 'Max Temp',
//                     data: '${weather.tempMax.toStringAsFixed(1)}°C'),
//                 WeatherTile(title: 'Weather Desc', data: weather.weatherDesc),
//                 WeatherTile(title: 'Humidity', data: '${weather.humidity}%'),
//                 WeatherTile(
//                     title: 'Wind Speed',
//                     data: '${weather.windSpeed} km/h ${weather.windDir}'),
//                 WeatherTile(title: 'Cloud Cover', data: '${weather.cloudPer}%'),
//                 // WeatherTile(
//                 //     title: 'Rainfall', data: '${weather.rainMMperHour} mm/h'),
//                 WeatherTile(
//                     title: 'Sunrise',
//                     data:
//                         '${DateTime.fromMillisecondsSinceEpoch(weather.sunrise * 1000, isUtc: true)}'),
//                 WeatherTile(
//                     title: 'Sunset',
//                     data:
//                         '${DateTime.fromMillisecondsSinceEpoch(weather.sunset * 1000, isUtc: true)}'),
//               ],
//             );
//           } else {
//             return Center(child: Text('Unknown Error'));
//           }
//         },
//       ),
//     );
//   }
// }
