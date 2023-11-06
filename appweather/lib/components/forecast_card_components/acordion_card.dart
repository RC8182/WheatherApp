import 'package:flutter/material.dart';

class AcordionCard extends StatefulWidget {
  const AcordionCard({
    super.key,
  });

  @override
  State<AcordionCard> createState() => _AcordionCardState();
}

class _AcordionCardState extends State<AcordionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ExpansionTile(
          title: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset('lib/Icons/wind.png'),
              ),
              const SizedBox(width: 10),
              const Text(
                'Actual Wind Speed',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text('Wind Speed'),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
