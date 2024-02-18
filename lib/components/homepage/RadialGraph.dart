import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Radial extends StatefulWidget {
  const Radial({super.key});

  @override
  State<Radial> createState() => _RadialState();
}

class _RadialState extends State<Radial> {
  late List<Diet> _raddata;
  var  _tooltipBehavior;

  @override
  void initState() {
    _raddata = getraddata();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 200,
      width: 200,
      child: SfCircularChart(
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          RadialBarSeries<Diet,String>(
            useSeriesColor: true,
            trackOpacity: 0.1,
            radius:"80%",
            innerRadius: "30%",
            gap:"10%",
            dataSource: _raddata,
            xValueMapper: (Diet data,_) => data.activity,
            yValueMapper: (Diet data, _) => data.quantity,
            dataLabelSettings: DataLabelSettings(isVisible: true,textStyle: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w600)),
            enableTooltip: true,
            cornerStyle: CornerStyle.bothCurve
          )
        ],
      ),
    );
  }

  List<Diet> getraddata() {
    final List<Diet> raddata = [
      Diet('Walking', 30),
      Diet('Workout', 100),
      Diet('Sleep', 120),
    ];
    return raddata;
  }
}

class Diet {
  Diet(this.activity, this.quantity);
  final String activity;
  final double quantity;
}
