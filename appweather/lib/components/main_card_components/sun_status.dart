import 'package:flutter/material.dart';

class SunStatus extends StatelessWidget {
  const SunStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String sunrise = '7:15 AM';
    const String dawn = '6:59 AM';
    const String sunset = '6:30 PM'; // Corrected sunset time
    const String twilight = '7:00 PM'; // Corrected twilight time
    Axis direction = MediaQuery.of(context).size.width < 500
        ? Axis.vertical
        : Axis.horizontal;

    return Flex(
      direction: direction,
      children: [
        Row(
          children: [
            Image.asset('lib/Icons/day/sunrise.png', width: 50, height: 50),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunrise: $sunrise'),
                Text('Dawn: $dawn'),
              ],
            ),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            Image.asset('lib/Icons/night/sunset.png', width: 50, height: 50),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunset: $sunset'),
                Text('Twilight: $twilight'),
              ],
            )
          ],
        )
      ],
    );
  }
}
