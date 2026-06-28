import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/theme/app_palette.dart';
import 'package:weather_app/widgets/additional_info_item.dart';
import 'package:weather_app/widgets/hourly_forecast_item.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.3,
            color: AppPalette.indigo,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<WeatherBloc>().add(WeatherFetched());
            },
            icon: const Icon(Icons.refresh, color: AppPalette.indigo),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppPalette.pearl,
                AppPalette.roseMist,
                AppPalette.lavender,
              ],
            ),
          ),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherFailure) {
                return Center(
                  child: Text(
                    state.error,
                    style: const TextStyle(color: AppPalette.indigo),
                  ),
                );
              }

              if (state is! WeatherSuccess) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppPalette.indigo,
                    ),
                  ),
                );
              }

              final data = state.weatherModel;
              final currentTemp = data.currentTemp;
              final currentSky = data.currentSky;
              final currentPressure = data.currentPressure;
              final currentWindSpeed = data.currentWindSpeed;
              final currentHumidity = data.currentHumidity;
              final hourlyForecast = data.hourlyForecast;

              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 108, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        elevation: 8,
                        margin: EdgeInsets.zero,
                        color: AppPalette.transparent,
                        shadowColor: AppPalette.indigo.withAlpha(75),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppPalette.periwinkle,
                                      AppPalette.indigo,
                                    ],
                                  ),
                                ),
                              ),
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${currentTemp.toStringAsFixed(1)} K',
                                        style: const TextStyle(
                                          fontSize: 34,
                                          fontWeight: FontWeight.w800,
                                          color: AppPalette.pearl,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Icon(
                                        currentSky == 'Clouds' ||
                                                currentSky == 'Rain'
                                            ? Icons.cloud
                                            : Icons.sunny,
                                        color: AppPalette.roseMist,
                                        size: 34,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        currentSky,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: AppPalette.pearl,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Hourly Forecast',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: AppPalette.indigo,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 124,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hourlyForecast.length,
                        itemBuilder: (context, index) {
                          final hourlyData = hourlyForecast[index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: HourlyForecastItem(
                              time:
                                  '${hourlyData.time.hour.toString().padLeft(2, '0')}:00',
                              temperature:
                                  '${hourlyData.temperature.toStringAsFixed(1)} K',
                              icon:
                                  hourlyData.sky == 'Clouds' ||
                                      hourlyData.sky == 'Rain'
                                  ? Icons.cloud
                                  : Icons.sunny,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      'Additional Information',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: AppPalette.indigo,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: AppPalette.pearl.withAlpha(140),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdditionalInfoItem(
                            icon: Icons.water_drop,
                            label: 'Humidity',
                            value: '$currentHumidity %',
                          ),
                          AdditionalInfoItem(
                            icon: Icons.air,
                            label: 'Wind Speed',
                            value: '${currentWindSpeed.toStringAsFixed(1)} m/s',
                          ),
                          AdditionalInfoItem(
                            icon: Icons.beach_access,
                            label: 'Pressure',
                            value: '$currentPressure hPa',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
