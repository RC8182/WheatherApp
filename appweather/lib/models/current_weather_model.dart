import 'package:flutter/material.dart';

class CurrentWeatherModel {
  final String time;
  final Image icon;
  final double temperature;
  final String dayState;
  final String weatherStatus;
  final double windSpeed;
  final int windDirection;

  CurrentWeatherModel({
    required this.time,
    required this.icon,
    required this.temperature,
    required this.dayState,
    required this.weatherStatus,
    required this.windSpeed,
    required this.windDirection,
  });

  static CurrentWeatherModel empty() {
    Image icon = Image.asset('lib/Icons/update.png', width: 40, height: 40);
    return CurrentWeatherModel(
      time: '',
      icon: icon,
      temperature: 0.0,
      dayState: '',
      weatherStatus: '',
      windSpeed: 0.0,
      windDirection: 0,
    );
  }
}
