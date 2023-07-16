import '../../../models/weather_model.dart';

List<WeatherDayModel> createDummyForecast() {
  return List<WeatherDayModel>.generate(5, (index) {
    final dateTime = DateTime.now().add(Duration(days: index));
    return WeatherDayModel(
      appMaxTemp: 20.0,
      appMinTemp: 15.0,
      clouds: 50,
      cloudsHi: 30,
      cloudsLow: 60,
      cloudsMid: 40,
      datetime: dateTime.toString(),
      dewpt: 10.0,
      highTemp: 22.0,
      lowTemp: 12.0,
      maxDhi: 0.0,
      maxTemp: 25.0,
      minTemp: 10.0,
      moonPhase: 0.5,
      moonPhaseLunation: 0.8,
      moonriseTs: 1234567890,
      moonsetTs: 1234567890,
      ozone: 300.0,
      pop: 20,
      precip: 5.0,
      pres: 1000.0,
      rh: 70,
      slp: 1010.0,
      snow: 0.0,
      snowDepth: 0.0,
      sunriseTs: 1234567890,
      sunsetTs: 1234567890,
      temp: 18.0,
      ts: 1234567890,
      uv: 6.0,
      validDate: dateTime.toString(),
      vis: 15.0,
      weather: WeatherModel(
        description: 'Sunny',
        code: 800,
        icon: 'a01d',
      ),
      windCdir: 'SW',
      windCdirFull: 'southwest',
      windDir: 225,
      windGustSpd: 10.0,
      windSpd: 5.0,
    );
  });
}
