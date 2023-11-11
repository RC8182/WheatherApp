import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

final List<Map<String, dynamic>> data = [
  {"hora": "05:38", "altura": "0.559", "tipo": "bajamar"},
  {"hora": "11:46", "altura": "1.979", "tipo": "pleamar"},
  {"hora": "17:56", "altura": "0.433", "tipo": "bajamar"},
  {"hora": "05:38", "altura": "0.559", "tipo": "bajamar"},
];
double hTide1 = double.parse(data[0]['hora']);
double hTide2 = double.parse(data[1]['hora']);
double hTide3 = double.parse(data[2]['hora']);
double hTide4 = double.parse(data[3]['hora']);

double aTide1 = double.parse(data[0]['altura']);
double aTide2 = double.parse(data[1]['altura']);
double aTide3 = double.parse(data[2]['altura']);
double aTide4 = double.parse(data[3]['altura']);

class TideLevelChart extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xFF0210D3),
    const Color(0xff23b6e6),
  ];

  TideLevelChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    String hour1 = data[0]['hora'];
    String hour2 = data[1]['hora'];
    String hour3 = data[2]['hora'];
    String hour4 = data[3]['hora'];

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(hour1, style: style);
        break;
      case 8:
        text = Text(hour2, style: style);
        break;
      case 16:
        text = Text(hour3, style: style);
        break;
      case 23:
        text = Text(hour4, style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1 -';
        break;
      case 2:
        text = '2 -';
        break;
      case 3:
        text = '3 -';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            // color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            // color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 23,
      minY: 0,
      maxY: 3,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, double.parse(data[0]['altura'])),
            FlSpot(8, double.parse(data[1]['altura'])),
            FlSpot(16, double.parse(data[2]['altura'])),
            FlSpot(23, double.parse(data[3]['altura'])),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
