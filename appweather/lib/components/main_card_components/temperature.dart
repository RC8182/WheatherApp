import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Temperature extends StatelessWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = context.watch<WeatherProvider>().currentWeatherModel;
    double temperature = weather.temperature;

    return Row(
      children: [
        Image.asset('lib/Icons/temp.png', width: 50, height: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Temperature: $temperatureºC'),
            const Text('Wather Temperature: 19ºC'),
          ],
        )
      ],
    );
  }
}
