import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class UvIndex extends StatelessWidget {
  const UvIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now();
    var formatter = DateFormat('HH');
    String formattedTime = formatter.format(time);
    int timeIndex = int.parse(formattedTime);

    var uv =
        context.watch<WeatherProvider>().forecastDays[0][timeIndex]['uvIndex'];
    return Row(
      children: [
        Image.asset('lib/Icons/uv.png', width: 50, height: 50),
        Text(
          'Index UV: $uv',
        )
      ],
    );
  }
}
