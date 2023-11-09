import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/main_card.dart';
import 'package:appweather/components/tide_level_card_components/tide_level_cart.dart';
import 'package:flutter/material.dart';

class TideLevelCard extends StatelessWidget {
  const TideLevelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tideStatus = 'Tide Status';
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('lib/Icons/bajamar.png', width: 50, height: 50),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Low Tide 1:'),
                        Text('Low Tide 2:'),
                      ],
                    ), // Cierre del corchete faltante aquí
                    const V_Divider(),
                    Image.asset('lib/Icons/pleamar.png', width: 50, height: 50),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('High Tide 1:'),
                        Text('High Tide 2:'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const TideLevelChart(),
        ],
      ),
    );
  }
}
