import 'package:flutter/material.dart';

class ForecastModel {
  final Image icon;
  final List time;
  final List temperature;
  final List uv;
  final List windSpeed;
  final List windGust;
  final List windDirection;

  ForecastModel({
    required this.icon,
    required this.time,
    required this.temperature,
    required this.uv,
    required this.windSpeed,
    required this.windGust,
    required this.windDirection,
  });
  static ForecastModel empty() {
    return ForecastModel(
      icon: Image.asset('lib/Icons/update.png', width: 40, height: 40),
      time: [''],
      temperature: [0.0],
      uv: [0],
      windGust: [0.0],
      windSpeed: [0.0],
      windDirection: [0],
    );
  }
}
