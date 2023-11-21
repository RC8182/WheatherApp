import 'package:appweather/components/custom_accordion/custom_accordion.dart';
import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/main_card_components/actual_wind_speed.dart';
import 'package:appweather/components/main_card_components/sun_status.dart';
import 'package:appweather/components/main_card_components/temperature.dart';
import 'package:appweather/components/main_card_components/city.dart';
import 'package:appweather/components/main_card_components/day_status.dart';
import 'package:appweather/components/main_card_components/uv_index.dart';
import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List sunInfo = context.watch<WeatherProvider>().forecastSunStatus;
    return ContainerCard(
      child: Column(children: [
        const H_Divider(),
        const CustomAccordion(spots: [
          'El Medano',
          'Pt Granadilla',
          'Adeje',
          'Guimar',
        ]),
        const H_Divider(),
        const IntrinsicHeight(
          child: Row(
            children: [
              City(),
              V_Divider(),
              Expanded(child: DayStatus()),
            ],
          ),
        ),
        const H_Divider(),
        SunStatus(
          sunrise: sunInfo[0]['sunrise'],
          sunset: sunInfo[0]['sunset'],
        ),
        const H_Divider(),
        const Temperature(),
        const H_Divider(),
        const UvIndex(),
        const H_Divider(),
        const ActualWindSpeed(),
      ]),
    );
  }
}

// ignore: camel_case_types
class V_Divider extends StatelessWidget {
  const V_Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      thickness: 1,
      color: Colors.orange,
    );
  }
}

// ignore: camel_case_types
class H_Divider extends StatelessWidget {
  const H_Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 0,
      thickness: 1,
      indent: 0,
      endIndent: 0,
      color: Colors.orange,
    );
  }
}
