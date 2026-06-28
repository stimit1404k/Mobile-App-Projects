import 'dart:convert';

class WeatherModel {
  final double currentTemp;
  final String currentSky;
  final int currentPressure;
  final double currentWindSpeed;
  final int currentHumidity;
  final List<HourlyForecast> hourlyForecast;

  WeatherModel({
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyForecast,
  });

  WeatherModel copyWith({
    double? currentTemp,
    String? currentSky,
    int? currentPressure,
    double? currentWindSpeed,
    int? currentHumidity,
    List<HourlyForecast>? hourlyForecast,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentSky: currentSky ?? this.currentSky,
      currentPressure: currentPressure ?? this.currentPressure,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      hourlyForecast: hourlyForecast ?? this.hourlyForecast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentSky': currentSky,
      'currentPressure': currentPressure,
      'currentWindSpeed': currentWindSpeed,
      'currentHumidity': currentHumidity,
      'hourlyForecast': hourlyForecast.map((x) => x.toMap()).toList(),
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    final weatherList = map['list'] as List<dynamic>;
    final currentWeatherData = weatherList.first as Map<String, dynamic>;
    final hourlyForecast = weatherList
        .take(8)
        .map((item) => HourlyForecast.fromMap(item as Map<String, dynamic>))
        .toList();

    return WeatherModel(
      currentTemp: (currentWeatherData['main']['temp'] as num).toDouble(),
      currentSky: currentWeatherData['weather'][0]['main'] as String,
      currentPressure: currentWeatherData['main']['pressure'],
      currentWindSpeed: (currentWeatherData['wind']['speed'] as num).toDouble(),
      currentHumidity: currentWeatherData['main']['humidity'],
      hourlyForecast: hourlyForecast,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp &&
        other.currentSky == currentSky &&
        other.currentPressure == currentPressure &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentHumidity == currentHumidity &&
        _listEquals(other.hourlyForecast, hourlyForecast);
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentSky.hashCode ^
        currentPressure.hashCode ^
        currentWindSpeed.hashCode ^
        currentHumidity.hashCode ^
        Object.hashAll(hourlyForecast);
  }

  bool _listEquals(List<HourlyForecast> a, List<HourlyForecast> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;

    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }

    return true;
  }
}

class HourlyForecast {
  final DateTime time;
  final double temperature;
  final String sky;

  const HourlyForecast({
    required this.time,
    required this.temperature,
    required this.sky,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.toIso8601String(),
      'temperature': temperature,
      'sky': sky,
    };
  }

  factory HourlyForecast.fromMap(Map<String, dynamic> map) {
    return HourlyForecast(
      time: DateTime.parse(map['dt_txt'] as String),
      temperature: (map['main']['temp'] as num).toDouble(),
      sky: map['weather'][0]['main'] as String,
    );
  }

  @override
  bool operator ==(covariant HourlyForecast other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.temperature == temperature &&
        other.sky == sky;
  }

  @override
  int get hashCode => time.hashCode ^ temperature.hashCode ^ sky.hashCode;
}
