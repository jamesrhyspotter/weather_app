class WeatherDayModel {
  final double appMaxTemp;
  final double appMinTemp;
  final int clouds;
  final int cloudsHi;
  final int cloudsLow;
  final int cloudsMid;
  final String datetime;
  final double dewpt;
  final double highTemp;
  final double lowTemp;
  final double maxDhi;
  final double maxTemp;
  final double minTemp;
  final double moonPhase;
  final double moonPhaseLunation;
  final int moonriseTs;
  final int moonsetTs;
  final double ozone;
  final int pop;
  final double precip;
  final double pres;
  final int rh;
  final double slp;
  final double snow;
  final double snowDepth;
  final int sunriseTs;
  final int sunsetTs;
  final double temp;
  final int ts;
  final double uv;
  final String validDate;
  final double vis;
  final WeatherModel weather;
  final String windCdir;
  final String windCdirFull;
  final int windDir;
  final double windGustSpd;
  final double windSpd;

  WeatherDayModel({
    required this.appMaxTemp,
    required this.appMinTemp,
    required this.clouds,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.datetime,
    required this.dewpt,
    required this.highTemp,
    required this.lowTemp,
    required this.maxDhi,
    required this.maxTemp,
    required this.minTemp,
    required this.moonPhase,
    required this.moonPhaseLunation,
    required this.moonriseTs,
    required this.moonsetTs,
    required this.ozone,
    required this.pop,
    required this.precip,
    required this.pres,
    required this.rh,
    required this.slp,
    required this.snow,
    required this.snowDepth,
    required this.sunriseTs,
    required this.sunsetTs,
    required this.temp,
    required this.ts,
    required this.uv,
    required this.validDate,
    required this.vis,
    required this.weather,
    required this.windCdir,
    required this.windCdirFull,
    required this.windDir,
    required this.windGustSpd,
    required this.windSpd,
  });

  factory WeatherDayModel.fromJSON(Map<String, dynamic> json) {
    return WeatherDayModel(
      appMaxTemp: json['app_max_temp'].toDouble(),
      appMinTemp: json['app_min_temp'].toDouble(),
      clouds: json['clouds'],
      cloudsHi: json['clouds_hi'],
      cloudsLow: json['clouds_low'],
      cloudsMid: json['clouds_mid'],
      datetime: json['datetime'],
      dewpt: json['dewpt'].toDouble(),
      highTemp: json['high_temp'].toDouble(),
      lowTemp: json['low_temp'].toDouble(),
      maxDhi: json['max_dhi']?.toDouble() ?? 0.0,
      maxTemp: json['max_temp'].toDouble(),
      minTemp: json['min_temp'].toDouble(),
      moonPhase: json['moon_phase'].toDouble(),
      moonPhaseLunation: json['moon_phase_lunation'].toDouble(),
      moonriseTs: json['moonrise_ts'],
      moonsetTs: json['moonset_ts'],
      ozone: json['ozone'].toDouble(),
      pop: json['pop'],
      precip: json['precip'].toDouble(),
      pres: json['pres'].toDouble(),
      rh: json['rh'],
      slp: json['slp'].toDouble(),
      snow: json['snow'].toDouble(),
      snowDepth: json['snow_depth'].toDouble(),
      sunriseTs: json['sunrise_ts'],
      sunsetTs: json['sunset_ts'],
      temp: json['temp'].toDouble(),
      ts: json['ts'],
      uv: json['uv'].toDouble(),
      validDate: json['valid_date'],
      vis: json['vis'].toDouble(),
      weather: WeatherModel.fromJSON(json['weather']),
      windCdir: json['wind_cdir'],
      windCdirFull: json['wind_cdir_full'],
      windDir: json['wind_dir'],
      windGustSpd: json['wind_gust_spd'].toDouble(),
      windSpd: json['wind_spd'].toDouble(),
    );
  }

  factory WeatherDayModel.fromEmpty() {
    return WeatherDayModel(
      appMaxTemp: 0.0,
      appMinTemp: 0.0,
      clouds: 0,
      cloudsHi: 0,
      cloudsLow: 0,
      cloudsMid: 0,
      datetime: '',
      dewpt: 0.0,
      highTemp: 0.0,
      lowTemp: 0.0,
      maxDhi: 0.0,
      maxTemp: 0.0,
      minTemp: 0.0,
      moonPhase: 0.0,
      moonPhaseLunation: 0.0,
      moonriseTs: 0,
      moonsetTs: 0,
      ozone: 0.0,
      pop: 0,
      precip: 0.0,
      pres: 0.0,
      rh: 0,
      slp: 0.0,
      snow: 0.0,
      snowDepth: 0.0,
      sunriseTs: 0,
      sunsetTs: 0,
      temp: 0.0,
      ts: 0,
      uv: 0.0,
      validDate: '',
      vis: 0.0,
      weather: WeatherModel.fromEmpty(),
      windCdir: '',
      windCdirFull: '',
      windDir: 0,
      windGustSpd: 0.0,
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
