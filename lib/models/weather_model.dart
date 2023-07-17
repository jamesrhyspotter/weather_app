class WeatherDayModel {
  final double appMaxTemp;
  final double appMinTemp;
  final String cityName;
  final double maxTemp;
  final double minTemp;
  final int pop;
  final double precip;
  final int rh;
  final double temp;
  final double uv;
  final double vis;
  final String icon;
  final String description;

  late double windSpd;

  WeatherDayModel({
    required this.appMaxTemp,
    required this.appMinTemp,
    required this.cityName,
    required this.description,
    required this.icon,
    required this.maxTemp,
    required this.minTemp,
    required this.pop,
    required this.precip,
    required this.rh,
    required this.temp,
    required this.uv,
    required this.vis,
    required this.windSpd,
  });

  factory WeatherDayModel.fromJSON(
      {required String name, required Map<String, dynamic> json}) {
    print('Initialising Weather from DATA');
    print(name);
    print(json['app_max_temp']);
    return WeatherDayModel(
      appMaxTemp: json['app_max_temp'].toDouble(),
      appMinTemp: json['app_min_temp'].toDouble(),
      cityName: name,
      description: json['weather']['description'] ?? '',
      icon: json['weather']['icon'] ?? 'u00n',
      maxTemp: json['max_temp'].toDouble(),
      minTemp: json['min_temp'].toDouble(),
      pop: json['pop'],
      precip: json['precip'].toDouble(),
      rh: json['rh'],
      temp: json['temp'].toDouble(),
      uv: json['uv'].toDouble(),
      vis: json['vis'].toDouble(),
      windSpd: json['wind_spd'].toDouble(),
    );
  }

  factory WeatherDayModel.fromEmpty() {
    return WeatherDayModel(
      appMaxTemp: 0.0,
      appMinTemp: 0.0,
      cityName: 'City',
      description: 'Description',
      icon: 't03n',
      maxTemp: 0.0,
      minTemp: 0.0,
      pop: 0,
      precip: 0.0,
      rh: 0,
      temp: 0.0,
      uv: 0.0,
      vis: 0.0,
      windSpd: 0.0,
    );
  }
}

class WeatherModel {
  final String description;
  final int code;
  final String icon;

  WeatherModel({
    required this.description,
    required this.code,
    required this.icon,
  });

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
      description: json['description'],
      code: json['code'],
      icon: json['icon'],
    );
  }

  factory WeatherModel.fromEmpty() {
    return WeatherModel(
      description: '',
      code: 0,
      icon: '',
    );
  }
}
