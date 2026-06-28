import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherDataProvider {
  Future<http.Response> getCurrentWeather(String cityName) async {
    return http
        .get(
          Uri.parse(
            'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
          ),
        )
        .timeout(const Duration(seconds: 10));
  }
}
