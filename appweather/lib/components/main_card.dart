import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/main_card_components/actual_wind_speed.dart';
import 'package:appweather/components/main_card_components/sun_status.dart';
import 'package:appweather/components/main_card_components/temperature.dart';
import 'package:appweather/components/main_card_components/city.dart';
import 'package:appweather/components/main_card_components/day_status.dart';
import 'package:appweather/components/main_card_components/uv_index.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ContainerCard(
      child: Column(children: [
        IntrinsicHeight(
          child: Row(
            children: [
              City(),
              V_Divider(),
              DayStatus(),
            ],
          ),
        ),
        H_Divider(),
        SunStatus(),
        H_Divider(),
        Temperature(),
        H_Divider(),
        UvIndex(),
        H_Divider(),
        ActualWindSpeed(),
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
