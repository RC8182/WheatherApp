import 'package:appweather/functions/functions.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TideLevelChart extends StatelessWidget {
  final Map<String, Map<String, List<String>>> tidesByDate;
  final today = getYearMounthDay();

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
    String hour1 = tidesByDate[today]!['hora']![0];
    String hour2 = tidesByDate[today]!['hora']![1];
    String hour3 = tidesByDate[today]!['hora']![2];
    String hour4 = tidesByDate[today]!['hora']![3];

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
            FlSpot(0, double.parse(tidesByDate[today]!['altura']![0])),
            FlSpot(8, double.parse(tidesByDate[today]!['altura']![1])),
            FlSpot(16, double.parse(tidesByDate[today]!['altura']![2])),
            FlSpot(23, double.parse(tidesByDate[today]!['altura']![3])),
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
