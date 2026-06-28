import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class FakeWeatherRepository implements WeatherRepository {
  @override
  dynamic get weatherDataProvider => null;

  @override
  Future<WeatherModel> getCurrentWeather() async {
    return WeatherModel(
      currentTemp: 295.15,
      currentSky: 'Clouds',
      currentPressure: 1013,
      currentWindSpeed: 4.12,
      currentHumidity: 72,
      hourlyForecast: [
        HourlyForecast(
          time: DateTime.parse('2026-06-28 12:00:00'),
          temperature: 294.15,
          sky: 'Clouds',
        ),
        HourlyForecast(
          time: DateTime.parse('2026-06-28 15:00:00'),
          temperature: 293.15,
          sky: 'Rain',
        ),
      ],
    );
  }
}

void main() {
  testWidgets('Weather app loads and renders successfully with custom color palette', (WidgetTester tester) async {
    // Build our app and inject the FakeWeatherRepository.
    await tester.pumpWidget(MyApp(weatherRepository: FakeWeatherRepository()));

    // Verify initial loader is shown or immediately loads the mock weather
    await tester.pump();

    // Verify that our mock weather elements are rendered
    expect(find.text('Weather App'), findsOneWidget);
    expect(find.text('295.1 K'), findsOneWidget);
    expect(find.text('Clouds'), findsAtLeast(1)); // Current sky and/or forecast
    
    // Check additional information items
    expect(find.text('Humidity'), findsOneWidget);
    expect(find.text('72 %'), findsOneWidget);
    expect(find.text('Wind Speed'), findsOneWidget);
    expect(find.text('4.1 m/s'), findsOneWidget);
    expect(find.text('Pressure'), findsOneWidget);
    expect(find.text('1013 hPa'), findsOneWidget);

    // Check hourly forecast items
    expect(find.text('12:00'), findsOneWidget);
    expect(find.text('294.1 K'), findsOneWidget);
    expect(find.text('15:00'), findsOneWidget);
    expect(find.text('293.1 K'), findsOneWidget);
  });
}
