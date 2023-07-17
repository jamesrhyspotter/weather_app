import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/view_models/services/weather_api_service.dart';

void main() {
  // Set up any necessary test setup or variables

  group('Weather API tests', () {
    late WeatherApiService weatherApiService;

    // Set up any necessary test setup or variables for the group

    setUp(() {
      // Set up specific actions or initialization steps before each test case
      weatherApiService = WeatherApiService();
    });

    test('Can Retrieve 16 Day Forecast Weather Data', () async {
      final weatherData = await weatherApiService.fetchWeatherData(
        lat: 0,
        lon: 0,
      );

      // Should get 16 day forecast
      expect(weatherData, isA<List>());
      expect(weatherData.length, 16);
    });

    test('Fails Gracefully, returns dummy data', () async {
      final weatherData = await weatherApiService.fetchWeatherData(
        lat: 190982374908273,
        lon: 190982374908273,
      );

      // Should get 16 day forecast
      expect(weatherData, isA<List>());
      expect(weatherData.length, 5);
    });

    // Add more test cases as needed within the group
  });

  // Add more groups with their own set up and test cases as needed
}
