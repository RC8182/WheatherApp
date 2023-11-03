import 'package:flutter/material.dart';

class CurrentWeatherModel {
  final String time;
  final Image icon =
      Image.asset('lib/Icons/day/clear-day.png', width: 40, height: 40);
  final double temperature;
  final String dayState;
  final String weatherStatus;
  final double windSpeed;
  final int windDirection;

  CurrentWeatherModel({
    required this.time,
    required icon,
    required this.temperature,
    required this.dayState,
    required this.weatherStatus,
    required this.windSpeed,
    required this.windDirection,
  });
  static CurrentWeatherModel empty() {
    Image isDay =
        Image.asset('lib/Icons/day/clear-day.png', width: 40, height: 40);
    return CurrentWeatherModel(
      time: 'N/A',
      icon: isDay,
      temperature: 0.0,
      dayState: 'N/A',
      weatherStatus: 'N/A',
      windSpeed: 0.0,
      windDirection: 0,
    );
  }
}
