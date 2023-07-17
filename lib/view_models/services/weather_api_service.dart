import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/view_models/services/dummy_data/dummy_data.dart';

import '../../models/weather_model.dart';

class WeatherApiService {
  String apiKey = '0a70eafca2094128b646cd9c500e42dc';

  Future<dynamic> fetchWeatherData(
      {required double lat, required double lon, required int count}) async {
    List output = [];
    try {
      var response = await http.get(Uri.parse(
          'https://api.weatherbit.io/v2.0/forecast/daily?lat=$lat&lon=$lon&key=$apiKey'));

      if (response.statusCode == 200) {
        // Request successful
        var jsonData = convert.jsonDecode(response.body);

        // print(jsonData);

        output = jsonData['data']
            .map((json) => WeatherDayModel.fromJSON(
                name: jsonData['city_name'], json: json))
            .toList();
        // output = createDummyForecast();
        // print(output);
      } else if (response.statusCode == 429) {
        print('Error ${response.statusCode}: too many api calls');
        print('Using dummy data');

        output = createDummyForecast();
      } else {
        // Error handling for unsuccessful requests

        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('No worky :(');
      output = createDummyForecast();
    }
    return output;
  }
}
