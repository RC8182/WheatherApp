import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/main_card.dart';
import 'package:appweather/components/tide_level_card_components/tide_level_cart.dart';
import 'package:flutter/material.dart';

class TideLevelCard extends StatelessWidget {
  const TideLevelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tideStatus = 'Tide Status';
    String lowTide1 = '12:00';
    String lowTide2 = '12:00';
    String highTide1 = '12:00';
    String highTide2 = '12:00';

    Axis direction = MediaQuery.of(context).size.width < 500
        ? Axis.vertical
        : Axis.horizontal;
    return ContainerCard(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.all(10),
            child: const Text(
              "Tide Level",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const H_Divider(),
          Column(
            children: [
              const SizedBox(height: 10),
              Text(
                tideStatus,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              IntrinsicHeight(
                child: Flex(
                  direction: direction,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/Icons/bajamar.png', width: 50, height: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Low Tide 1: $lowTide1'),
                        Text('Low Tide 2: $lowTide2'),
                      ],
                    ), // Cierre del corchete faltante aquí
                    const V_Divider(),
                    Image.asset('lib/Icons/pleamar.png', width: 50, height: 50),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('High Tide 1: $highTide1'),
                        Text('High Tide 2: $highTide2'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          TideLevelChart(),
        ],
      ),
    );
  }
}
