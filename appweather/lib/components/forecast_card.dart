import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/forecast_card_components/single_forecast_card.dart';
import 'package:appweather/components/main_card.dart';
import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForecastCard extends StatefulWidget {
  const ForecastCard({Key? key}) : super(key: key);

  @override
  State<ForecastCard> createState() => _ForecastCardState();
}

class _ForecastCardState extends State<ForecastCard> {
  int selectedDays = 1;

  @override
  Widget build(BuildContext context) {
    var forecastDays = context.watch<WeatherProvider>().forecastDays;
    var selectedForecastDays = forecastDays.sublist(0, selectedDays);
    Axis direction = MediaQuery.of(context).size.width < 500
        ? Axis.vertical
        : Axis.horizontal;

    return ContainerCard(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: const Text("Forecast:"),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flex(
                direction: direction,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDays = 1;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedDays == 1 ? Colors.blue : null,
                      ),
                      child: const Text('1D'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDays = 2;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedDays == 2 ? Colors.blue : null,
                      ),
                      child: const Text('2D'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDays = 3;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedDays == 3 ? Colors.blue : null,
                      ),
                      child: const Text('3D'),
                    ),
                    const SizedBox(width: 10, height: 50),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDays = 4;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedDays == 4 ? Colors.blue : null,
                      ),
                      child: const Text('4D'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDays = 5;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedDays == 5 ? Colors.blue : null,
                      ),
                      child: const Text('5D'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedDays = 6;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedDays == 6 ? Colors.blue : null,
                      ),
                      child: const Text('6D'),
                    ),
                    const SizedBox(width: 10, height: 50),
                  ]),
                ],
              ),
            ),
          ),
          const H_Divider(),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: selectedForecastDays.length,
            itemBuilder: (BuildContext context, int index) {
              var forecastDay = selectedForecastDays[index];
              return Column(
                children: [
                  SingleForecastCard(forecastDays: forecastDay),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
          const H_Divider(),
        ],
      ),
    );
  }
}
