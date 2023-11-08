import 'package:appweather/functions/functions.dart';
import 'package:flutter/material.dart';

class ForecastTemp extends StatelessWidget {
  final List forecastDay;
  const ForecastTemp({Key? key, required this.forecastDay}) : super(key: key);
// forecastDay bring the data of the forecast for the day splited and depend of the day selected
  @override
  Widget build(BuildContext context) {
    List<double> dayTemperatures = [];
    for (var i = 0; i < forecastDay.length; i++) {
      dayTemperatures.add(forecastDay[i]['temperature']);
    }
    var maxTemperature = findLargest(dayTemperatures);
    var minTemperature = findSmallest(dayTemperatures);

    return Row(
      children: [
        Image.asset('lib/Icons/temp.png', width: 50, height: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Max. Temperature : $maxTemperatureºC'),
            Text('Min. Temperature : $minTemperatureºC'),
          ],
        )
      ],
    );
  }
}
