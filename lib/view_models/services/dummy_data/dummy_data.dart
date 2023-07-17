import '../../../models/weather_model.dart';

List<WeatherDayModel> createDummyForecast() {
  return List<WeatherDayModel>.generate(5, (index) {
    final dateTime = DateTime.now().add(Duration(days: index));
    return WeatherDayModel(
      appMaxTemp: 20.0,
      appMinTemp: 15.0,
      cityName: 'Example City',
      description: 'Description',
      icon: 't01n',
      maxTemp: 25.0,
      minTemp: 10.0,
      pop: 20,
      precip: 5.0,
      rh: 70,
      temp: 18.0,
      uv: 6.0,
      vis: 15.0,
      windSpd: 5.0,
    );
  });
}
