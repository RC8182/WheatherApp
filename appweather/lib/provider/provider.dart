import 'package:appweather/functions/functions.dart';
import 'package:appweather/models/current_weather_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherProvider extends ChangeNotifier {
  var _currentWeatherModel = CurrentWeatherModel.empty();
  CurrentWeatherModel get currentWeatherModel => _currentWeatherModel;
  var _forecastList = [];
  List get forecastList => _forecastList;
  var _forecastDays = [];
  List get forecastDays => _forecastDays;

  String url =
      'https://api.open-meteo.com/v1/forecast?latitude=28.05&longitude=-16.54&hourly=temperature_2m,weathercode,windspeed_10m,windgusts_10m,winddirection_10m,uv_index&models=gfs_global&current_weather=true&windspeed_unit=kn&timezone=Europe%2FLondon';

  Future<void> fetchWeather() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      String isDay = data['current_weather']['is_day'] == 1 ? 'Day' : 'Night';
      int weatherCode = data['current_weather']['weathercode'];
      double currentTemperature = data['current_weather']['temperature'];
      String weatherStatus = 'Day';
      double currentWindSpeed = data['current_weather']['windspeed'];
      int currentWindDirection = data['current_weather']['winddirection'];
      String currentTime = data['current_weather']['time'];
      Image icon;

      // Forecast section //

      List times = data['hourly']['time'];
      List temperatures = data['hourly']['temperature_2m'];
      List weatherCodes = data['hourly']['weathercode'];
      List windSpeeds = data['hourly']['windspeed_10m'];
      List windGusts = data['hourly']['windgusts_10m'];
      List windDirections = data['hourly']['winddirection_10m'];
      List uvIndices = data['hourly']['uv_index'];

      for (int i = 0; i < times.length; i++) {
        Map<String, dynamic> hourInfo = {
          'time': times[i],
          'temperature': temperatures[i],
          'weatherCode': weatherCodes[i],
          'windSpeed': windSpeeds[i],
          'windGust': windGusts[i],
          'windDirection': windDirections[i],
          'uvIndex': uvIndices[i],
        };
        forecastList.add(hourInfo);
      }
      List todayForecast = [];
      List day1 = [];
      List day2 = [];
      List day3 = [];
      List day4 = [];
      List day5 = [];
      List day6 = [];

      for (var i = 0; i < forecastList.length; i++) {
        if (i < 24) {
          todayForecast.add(forecastList[i]);
        } else if (i < 48) {
          day1.add(forecastList[i]);
        } else if (i < 72) {
          day2.add(forecastList[i]);
        } else if (i < 96) {
          day3.add(forecastList[i]);
        } else if (i < 120) {
          day4.add(forecastList[i]);
        } else if (i < 144) {
          day5.add(forecastList[i]);
        } else {
          day6.add(forecastList[i]);
        }
      }
      _forecastDays = [todayForecast, day1, day2, day3, day4, day5, day6];
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
        time: currentTime,
        icon: icon,
        temperature: currentTemperature,
        dayState: isDay,
        weatherStatus: weatherStatus,
        windSpeed: currentWindSpeed,
        windDirection: currentWindDirection,
      );
      _forecastDays = forecastDays;
      _forecastList = forecastList;
      _currentWeatherModel = weather;
      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

class TidesProvider extends ChangeNotifier {
  var _tidesList = [];
  List get tidesList => _tidesList;

  Future<void> fetchTides() async {
    String currenmonth = getYearMounth();

    String url =
        'https://ideihm.covam.es/api-ihm/getmarea?request=gettide&id=64&format=json&month=$currenmonth';
    final response = await http.get(Uri.parse(url));
    // ignore: avoid_print
    print(currenmonth);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List predictionsTides = data['mareas']['datos']['marea'];

      _tidesList = predictionsTides;
      _tidesList = tidesList;
      notifyListeners();
    } else {
      throw Exception('Failed to load tides data');
    }
  }
}
