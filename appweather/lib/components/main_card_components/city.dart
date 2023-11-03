import 'package:appweather/functions/functions.dart';
import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    void onSubmit() {
      context.read<WeatherProvider>().fetchWeather();
      setState(() => _isLoading = true);
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() => _isLoading = false),
      );
    }

    String time = getCurrentFormattedTime();
    String date = getCurrentFormattedDate();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('El Médano',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: _isLoading
                ? Container(
                    width: 24,
                    height: 24,
                    padding: const EdgeInsets.all(2.0),
                    child: const CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.refresh_sharp),
            color: Colors.black,
            onPressed: () {
              onSubmit();
            },
          ),
          Column(
            children: [
              _isLoading
                  ? const Column(
                      children: [
                        Text(
                          'Updated at:',
                        ),
                        Text(
                          ' Loading...',
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        CustomText(
                          text: 'Updated at:',
                          value: time,
                        ),
                        CustomText(
                          value: date,
                          text: '',
                        ),
                      ],
                    ),
              //Text(time),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String value;
  final String text; // Ahora 'text' es opcional (puede ser nulo).

  const CustomText({
    Key? key,
    required this.value,
    required this.text, // 'text' ahora es opcional y puede ser nulo.
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      style: const TextStyle(fontSize: 10),
      '$text $value', // Usa el valor de 'text' si no es nulo, de lo contrario, usa una cadena vacía.
    );
  }
}
