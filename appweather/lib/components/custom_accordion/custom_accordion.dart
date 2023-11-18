// ignore_for_file: use_key_in_widget_constructors

import "package:flutter/material.dart";

class CustomAccordion extends StatefulWidget {
  final List<String> spots;

  const CustomAccordion({required this.spots});

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
          title: Text(_selectedSpot.isEmpty ? widget.spots[0] : _selectedSpot),
          subtitle: const Text('Tap to select the Spot'),
          children: widget.spots.map((spot) {
            return ListTile(
              title: Text(spot),
              onTap: () {
                setState(() {
                  _selectedSpot = spot;
                  controller.collapse();
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
