import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DayStatus extends StatelessWidget {
  const DayStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = context.watch<WeatherProvider>().currentWeatherModel;
    Axis direction = MediaQuery.of(context).size.width < 500
        ? Axis.vertical
        : Axis.horizontal;
    String dayStatus = weather.weatherStatus;
    Image dayIcon = weather.icon;
    return Container(
      margin: const EdgeInsets.all(10),
      child: Flex(
        direction: direction,
        children: [
          dayIcon,
          const SizedBox(width: 10),
          Text(dayStatus,
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
