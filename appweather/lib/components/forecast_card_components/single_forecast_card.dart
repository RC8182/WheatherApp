import "package:appweather/components/forecast_card_components/acordion_card.dart";
import "package:appweather/components/forecast_card_components/forecast_temp.dart";
import "package:appweather/components/main_card_components/sun_status.dart";
import "package:appweather/functions/functions.dart";
import "package:flutter/material.dart";

class SingleForecastCard extends StatelessWidget {
  final List forecastDays;
  final String sunset;
  final String sunrise;
  const SingleForecastCard(
      {Key? key,
      required this.forecastDays,
      required this.sunrise,
      required this.sunset})
      : super(key: key);

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
            child: Text(formatDate(forecastDays[0]['time']),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: SunStatus(
              sunrise: sunrise,
              sunset: sunset,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: AcordionCard(
              forecastDay: forecastDays,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: ForecastTemp(
              forecastDay: forecastDays,
            ),
          ),
        ],
      ),
    );
  }
}
