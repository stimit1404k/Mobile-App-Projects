import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/screens/weather_screen.dart';
import 'package:weather_app/theme/app_palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherRepository? weatherRepository;
  const MyApp({super.key, this.weatherRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          weatherRepository ?? WeatherRepository(WeatherDataProvider()),

      child: BlocProvider(
        create: (context) =>
            WeatherBloc(context.read<WeatherRepository>())
              ..add(WeatherFetched()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppPalette.pearl,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppPalette.indigo,
              brightness: Brightness.light,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppPalette.transparent,
              foregroundColor: AppPalette.indigo,
              elevation: 0,
              centerTitle: true,
            ),
          ),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
