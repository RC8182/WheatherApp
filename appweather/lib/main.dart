import 'package:appweather/components/main_card.dart';
import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(), child: const AppWeather()));

class AppWeather extends StatefulWidget {
  const AppWeather({super.key});

  @override
  State<AppWeather> createState() => _AppWeatherState();
}

class _AppWeatherState extends State<AppWeather> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppWeather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: const Color(0xFFE4E0DD),
          appBar: AppBar(
            title: const Text('Weather in El Médano'),
          ),
          body: const MainCard(),
        ));
  }
}
