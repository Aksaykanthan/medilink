import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:project_01/pages/home.dart';

class BarGraph extends StatelessWidget {
  final List weeklySummary;
  const BarGraph({super.key, required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
        sunDist: weeklySummary[0],
        monDist: weeklySummary[1],
        tueDist: weeklySummary[2],
        wedDist: weeklySummary[3],
        thuDist: weeklySummary[4],
        friDist: weeklySummary[5],
        satDist: weeklySummary[6]);

    barData.initializeBar();
    return BarChart(BarChartData(
        maxY: 40,
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles)),
        ),
        barGroups: barData.barData
            .map((data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.grey[800],
                      width: 13,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true, toY: 40, color: Colors.white30))
                ]))
            .toList()));
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  var style = const TextStyle(
      color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 12);
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text("Mon", style: style);
      break;
    case 2:
      text = Text("Tue", style: style);
      break;
    case 3:
      text = Text("Wed", style: style);
      break;
    case 4:
      text = Text("Thu", style: style);
      break;
    case 5:
      text = Text("Fri", style: style);
      break;
    case 6:
      text = Text("Sat", style: style);
      break;
    case 7:
      text = Text("Sun", style: style);
      break;
    default:
      text = Text('', style: style);
      break;
  }
  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
