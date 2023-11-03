import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActualWindSpeed extends StatelessWidget {
  const ActualWindSpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var weather = context.watch<WeatherProvider>().currentWeatherModel;
    double actualWind = weather.windSpeed;
    int windDirection = weather.windDirection;
    const double height = 250; //Buena practica: declarar constantes
    const double width = 250;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset('lib/Icons/wind.png', width: 50, height: 50),
            Text(
              'Actual Wind Speed: $actualWind knots',
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: [
              RotationTransition(
                turns: AlwaysStoppedAnimation(windDirection / 360),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('lib/Icons/arrow.png',
                      width: 200, height: 200),
                ),
              ),
              SizedBox(
                child: Image.asset('lib/Icons/compassRose.png',
                    color: Colors.blue, width: 250, height: 250),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Image.asset(
              'lib/Icons/compass.png',
              width: 50,
              height: 50,
              color: Colors.orange,
            ),
            Text(
              'Wind Direction: $windDirection º',
            ),
          ],
        ),
      ],
    );
  }
}
