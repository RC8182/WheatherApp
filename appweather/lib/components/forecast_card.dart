import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/forecast_card_components/single_forecast_card.dart';
import 'package:appweather/components/main_card.dart';
import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastToday = context.watch<WeatherProvider>().forecastDays[0];
    var day1 = context.watch<WeatherProvider>().forecastDays[1];
    var day2 = context.watch<WeatherProvider>().forecastDays[2];
    var day3 = context.watch<WeatherProvider>().forecastDays[3];
    var day4 = context.watch<WeatherProvider>().forecastDays[4];
    var day5 = context.watch<WeatherProvider>().forecastDays[5];
    var day6 = context.watch<WeatherProvider>().forecastDays[6];
    return ContainerCard(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10), // Set margin using EdgeInsets
            child: const Text("Forecast"),
          ),
          const H_Divider(),
          const SizedBox(height: 20),
          // Map single forecast card to a list of forecast cards
          SingleForecastCard(forecastDays: forecastToday),
          const SizedBox(height: 20),
          SingleForecastCard(forecastDays: day1),
          const SizedBox(height: 20),
          SingleForecastCard(forecastDays: day2),
          const SizedBox(height: 20),
          SingleForecastCard(forecastDays: day3),
          const SizedBox(height: 20),
          SingleForecastCard(forecastDays: day4),
          const SizedBox(height: 20),
          SingleForecastCard(forecastDays: day5),
          const SizedBox(height: 20),
          SingleForecastCard(forecastDays: day6),
          const SizedBox(height: 20),

          const H_Divider(),
        ],
      ),
    );
  }
}
