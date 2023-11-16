import 'package:appweather/functions/functions.dart';
import 'package:flutter/material.dart';

class SunStatus extends StatelessWidget {
  final String sunrise;
  final String sunset;
  const SunStatus({Key? key, required this.sunset, required this.sunrise})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Axis direction = MediaQuery.of(context).size.width < 500
        ? Axis.vertical
        : Axis.horizontal;

    return Flex(
      direction: direction,
      children: [
        Row(
          children: [
            Image.asset('lib/Icons/day/sunrise.png', width: 50, height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunrise: ${getHour(sunrise)} AM'),
              ],
            ),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            Image.asset('lib/Icons/night/sunset.png', width: 50, height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunset: ${getHour(sunset)} PM'),
              ],
            )
          ],
        )
      ],
    );
  }
}
