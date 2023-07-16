import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/views/theme/type_face.dart';

import '../../../view_models/controllers/weather_view_controller.dart';

class LocationWidget extends StatelessWidget {
  String location;
  final WeatherViewController ctrl = Get.find<WeatherViewController>();

  LocationWidget({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(location, textAlign: TextAlign.center, style: h2),
    );
  }
}
