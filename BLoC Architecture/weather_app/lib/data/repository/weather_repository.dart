import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);

  Future<WeatherModel> getCurrentWeather() async {
    String cityName = 'London';
    final response = await weatherDataProvider.getCurrentWeather(cityName);

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final code = data['cod']?.toString();

    if (response.statusCode != 200 || code != '200') {
      final message = data['message']?.toString();
      throw message ?? 'Weather API request failed (code: $code)';
    }

    return WeatherModel.fromMap(data);
  }
}
