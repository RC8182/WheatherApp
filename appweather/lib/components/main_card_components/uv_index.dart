import 'package:flutter/material.dart';

class UvIndex extends StatelessWidget {
  const UvIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var uv = '5';
    return Row(
      children: [
        Image.asset('lib/Icons/uv.png', width: 50, height: 50),
        Text(
          'Index UV: $uv',
        )
      ],
    );
  }
}
