import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/view_models/services/dummy_data/dummy_data.dart';

import '../../models/weather_model.dart';

class WeatherApiService {
  String apiKey = '0a70eafca2094128b646cd9c500e42dc';

  Future<http.Response> httpGet(Uri url) {
    return http.get(url);
  }

  Future<List<WeatherDayModel>> fetchWeatherData(
      {required String city, required int count}) async {
    List<WeatherDayModel> output = [];
    try {
      var response = await http.get(Uri.parse(
          'https://api.weatherbit.io/v2.0/forecast/daily?city=$city&key=$apiKey'));

      if (response.statusCode == 200) {
        // Request successful
        var jsonData = convert.jsonDecode(response.body);

        output = jsonData['data']
            .map((json) => WeatherDayModel.fromJSON(json))
            .toList();
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
    }
    return output;
  }
}
