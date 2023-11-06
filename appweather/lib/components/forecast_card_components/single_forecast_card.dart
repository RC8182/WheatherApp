import "package:appweather/components/forecast_card_components/acordion_card.dart";
import "package:appweather/components/main_card_components/sun_status.dart";
import "package:appweather/components/main_card_components/temperature.dart";
import "package:flutter/material.dart";

class SingleForecastCard extends StatelessWidget {
  const SingleForecastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: const Text('Date'),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: const SunStatus(),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: const AcordionCard(),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: const Temperature(),
          ),
        ],
      ),
    );
  }
}
