import 'package:appweather/models/current_weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  var _currentWeatherModel = CurrentWeatherModel.empty();
  CurrentWeatherModel get currentWeatherModel => _currentWeatherModel;
  String url =
      'https://api.open-meteo.com/v1/forecast?latitude=28.05&longitude=-16.54&hourly=temperature_2m,weathercode,windspeed_10m,windgusts_10m,winddirection_10m,uv_index&models=gfs_global&current_weather=true&windspeed_unit=kn&timezone=Europe%2FLondon';

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String isDay = data['current_weather']['is_day'] == 1 ? 'Day' : 'Night';
      int weatherCode = data['current_weather']['weathercode'];
      double temperature = data['current_weather']['temperature'];
      String weatherStatus = 'Day';
      double windSpeed = data['current_weather']['windspeed'];
      int windDirection = data['current_weather']['winddirection'];
      String time = data['current_weather']['time'];
      Image icon;

      // ignore: avoid_print
      print(
          'FetchWeather: Hora $time, Temp $temperature, Estado tiempo $weatherCode, Es dia $isDay,  Viento $windSpeed, Dir viento $windDirection');

      switch (weatherCode) {
        case 0:
          weatherStatus = 'Clear';
          icon = isDay == 'Day'
              ? Image.asset('lib/Icons/day/clear-day.png',
                  width: 40, height: 40)
              : Image.asset('lib/Icons/night/clear-nigth.png',
                  width: 40, height: 40);
          break;
        case 1:
          weatherStatus = 'Cloudy';
          icon = isDay == 'Day'
              ? Image.asset('lib/Icons/day/claudy-day.png',
                  width: 40, height: 40)
              : Image.asset('lib/Icons/night/claudy-nigth.png',
                  width: 40, height: 40);
        case 2:
          weatherStatus = 'Light rain';
          icon = isDay == 'Day'
              ? Image.asset('lib/Icons/day/raining-day.png',
                  width: 40, height: 40)
              : Image.asset('lib/Icons/night/raining-nigth.png',
                  width: 40, height: 40);
          break;
        case 3:
          weatherStatus = 'Rainy';
          icon = Image.asset('lib/Icons/day/raining-day.png',
              width: 40, height: 40);
          break;
        default:
          icon = isDay == 'Day'
              ? Image.asset('lib/Icons/day/clear-day.png',
                  width: 40, height: 40)
              : Image.asset('lib/Icons/night/clear-nigth.png',
                  width: 40, height: 40);
      }

      CurrentWeatherModel weather = CurrentWeatherModel(
        time: time,
        icon: icon,
        temperature: temperature,
        dayState: isDay,
        weatherStatus: weatherStatus,
        windSpeed: windSpeed,
        windDirection: windDirection,
      );

      _currentWeatherModel = weather;
      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
