import 'package:appweather/components/forecast_card.dart';
import 'package:appweather/components/main_card.dart';
import 'package:appweather/components/tide_level_card.dart';
import 'package:appweather/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider<WeatherProvider>(
          create: (context) => WeatherProvider()),
      ChangeNotifierProvider(create: (context) => TidesProvider()),
    ], child: const AppWeather()));

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
    context.read<TidesProvider>().fetchTides();
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
            title: const Center(child: Text('Canary Wind')),
          ),
          body: ListView(
            children: const [
              MainCard(),
              ForecastCard(),
              TideLevelCard(),
            ],
          ),
        ));
  }
}
