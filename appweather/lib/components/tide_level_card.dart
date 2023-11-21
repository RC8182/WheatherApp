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
    String today = getToday();
    String tomorrow = getTomorrow();

    String tideStatus = 'Tide Status';
    String tideTime1 = tidesByDate[today]!['hora']![0];
    String tideTipe1 = tidesByDate[today]!['tipo']![0];
    String tideTime2 = tidesByDate[today]!['hora']![1];
    String tideTipe2 = tidesByDate[today]!['tipo']![1];
    String tideTime3 = tidesByDate[today]!['hora']![2];
    String tideTipe3 = tidesByDate[today]!['tipo']![2];
    String tideTime4 = tidesByDate[today]!['hora']!.length == 4
        ? tidesByDate[today]!['hora']![3]
        : tidesByDate[tomorrow]!['hora']![0];
    String tideTipe4 = tidesByDate[today]!['tipo']!.length == 4
        ? tidesByDate[today]!['tipo']![3]
        : tidesByDate[tomorrow]!['tipo']![0];

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
                        Text('Tide 1: $tideTime1, $tideTipe1'),
                        Text('Tide 2: $tideTime2, $tideTipe2'),
                      ],
                    ), // Cierre del corchete faltante aquí
                    const V_Divider(),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tide 3: $tideTime3, $tideTipe3'),
                        Text('Tide 4: $tideTime4, $tideTipe4'),
                      ],
                    ),
                    Image.asset('lib/Icons/pleamar.png', width: 50, height: 50),
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
