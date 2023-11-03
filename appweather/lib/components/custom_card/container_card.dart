import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const ContainerCard({
    Key? key,
    required this.child,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ],
    );
  }
}
