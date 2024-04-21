import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SplineAreaChartWidget extends StatelessWidget {
  const SplineAreaChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SplineAreaChartData> chartData = <SplineAreaChartData>[
      SplineAreaChartData(2010, 10.53),
      SplineAreaChartData(2011, 9.5),
      SplineAreaChartData(2012, 10),
      SplineAreaChartData(2013, 9.4),
      SplineAreaChartData(2014, 5.8),
      SplineAreaChartData(2015, 4.9),
      SplineAreaChartData(2016, 4.5),
      SplineAreaChartData(2017, 3.6),
      SplineAreaChartData(2018, 10),
    ];
    return Scaffold(
        body: Center(
            child: SizedBox(
                child: SfCartesianChart(series: <CartesianSeries>[
      SplineAreaSeries<SplineAreaChartData, int>(
          dataSource: chartData,
          dashArray: const <double>[5, 5],
          xValueMapper: (SplineAreaChartData data, _) => data.x,
          yValueMapper: (SplineAreaChartData data, _) => data.y)
    ]))));
  }
}

class SplineAreaChartData {
  SplineAreaChartData(this.x, this.y);
  final int x;
  final double y;
}
