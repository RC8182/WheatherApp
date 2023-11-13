import 'package:appweather/components/custom_card/container_card.dart';
import 'package:appweather/components/main_card.dart';
import 'package:appweather/components/tide_level_card_components/tide_level_cart.dart';
import 'package:appweather/functions/functions.dart';
import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TideLevelCard extends StatelessWidget {
  const TideLevelCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tidesList = context.watch<TidesProvider>().tidesList;

    Map<String, Map<String, List<String>>> tidesByDate = {};

    for (int i = 0; i < tidesList.length; i++) {
      String fecha = tidesList[i]['fecha'];
      tidesByDate[fecha] ??= {'hora': [], 'altura': [], 'tipo': []};
      tidesByDate[fecha]!['hora']?.add(tidesList[i]['hora']);
      tidesByDate[fecha]!['altura']?.add(tidesList[i]['altura']);
      tidesByDate[fecha]!['tipo']?.add(tidesList[i]['tipo']);
    }
    String today = getYearMounthDay();

    print(tidesByDate);
    List<String> lowTides = [];
    List<String> highTides = [];

    if (tidesByDate.containsKey(today)) {
      List<String> tipos = tidesByDate[today]!['tipo']!;
      List<String> horas = tidesByDate[today]!['hora']!;

      for (int i = 0; i < tipos.length; i++) {
        switch (tipos[i]) {
          case 'bajamar':
            lowTides.add(horas[i]);
            break;
          case 'pleamar':
            highTides.add(horas[i]);
            break;
          default:
        }
      }
    }

    String tideStatus = 'Tide Status';
    String lowTide1 = lowTides[0];
    String lowTide2 = lowTides[1];
    String highTide1 = highTides[0];
    String highTide2 = highTides[1];

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
          TideLevelChart(tidesByDate: tidesByDate),
        ],
      ),
    );
  }
}
