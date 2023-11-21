import 'package:appweather/functions/functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TideLevelChart extends StatelessWidget {
  final Map<String, Map<String, List<String>>> tidesByDate;
  final today = getToday();
  final tomorrow = getTomorrow();
  final yesterday = getYesterday();

  TideLevelChart({Key? key, required this.tidesByDate}) : super(key: key);
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xFF0210D3),
    const Color(0xff23b6e6),
  ];

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
    String tide1 = tidesByDate[today]!['hora']![0];
    String tide2 = tidesByDate[today]!['hora']![1];
    String tide3 = tidesByDate[today]!['hora']![2];
    String tide4 = tidesByDate[today]!['hora']!.length == 4
        ? tidesByDate[today]!['hora']![3]
        : tidesByDate[tomorrow]!['hora']![0];
    String tide5 = tidesByDate[today]!['hora']!.length == 4
        ? tidesByDate[tomorrow]!['hora']![0]
        : tidesByDate[tomorrow]!['hora']![1];
    Widget text;

    switch (value.toInt()) {
      case 0:
        text = Text(tide1, style: style);
        break;
      case 8:
        text = Text(tide2, style: style);
        break;
      case 16:
        text = Text(tide3, style: style);
        break;
      case 24:
        text = Text(tide4, style: style);
        break;
      case 32:
        text = Text(tide5, style: style);
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

      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    double height1 = double.parse(tidesByDate[today]!['altura']![0]);
    double height2 = double.parse(tidesByDate[today]!['altura']![1]);
    double height3 = double.parse(tidesByDate[today]!['altura']![2]);
    double height4 = tidesByDate[today]!['altura']!.length == 4
        ? double.parse(tidesByDate[today]!['altura']![3])
        : double.parse(tidesByDate[tomorrow]!['altura']![0]);
    double height5 = tidesByDate[today]!['altura']!.length == 4
        ? double.parse(tidesByDate[tomorrow]!['altura']![0])
        : double.parse(tidesByDate[tomorrow]!['altura']![1]);

    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
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
      maxX: 32,
      minY: 0,
      maxY: 2,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, height1),
            FlSpot(8, height2),
            FlSpot(16, height3),
            FlSpot(23, height4),
            FlSpot(32, height5),
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
