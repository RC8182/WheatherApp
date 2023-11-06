import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/forecast_card_components/single_forecast_card.dart';
import 'package:appweather/components/main_card.dart';
import 'package:flutter/material.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainerCard(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10), // Set margin using EdgeInsets
            child: const Text("Forecast"),
          ),
          const H_Divider(),
          const SizedBox(height: 20),
          // Map single forecast card to a list of forecast cards
          const SingleForecastCard(),
          const SizedBox(height: 20),
          const H_Divider(),
        ],
      ),
    );
  }
}
