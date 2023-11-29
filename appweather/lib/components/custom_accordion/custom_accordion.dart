import "package:appweather/provider/provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CustomAccordion extends StatefulWidget {
  final List<String> spots;

  const CustomAccordion({super.key, required this.spots});

  @override
  State<CustomAccordion> createState() => _CustomAccordionState();
}

class _CustomAccordionState extends State<CustomAccordion> {
  String _selectedSpot = '';
  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          controller: controller,
          title: const Text('Tap to select the Spot'),
          //subtitle: const Text('Tap to select the Spot'),
          children: widget.spots.map((spot) {
            return ListTile(
              title: Text(spot),
              onTap: () {
                setState(() {
                  _selectedSpot = spot;
                  controller.collapse();
                  context.read<WeatherProvider>().setLocation(_selectedSpot);
                  context.read<WeatherProvider>().fetchWeather();
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
