import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class RequestPie extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _RequestPieState createState() => _RequestPieState();
}

class _RequestPieState extends State<RequestPie> {
  final dataMap = <String, double>{
    "Completion": 8,
    "Complete": 2,
  };

  final colorList = <Color>[
    Colors.white,
    Colors.grey,
  ];

  int key = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: PieChart(
        emptyColor: Colors.transparent,
        chartRadius: 75,
        legendOptions: const LegendOptions(
          showLegends: false,
        ),
        dataMap: dataMap,
        chartType: ChartType.ring,
        baseChartColor: Colors.transparent,
        colorList: colorList,
        chartValuesOptions: const ChartValuesOptions(
            chartValueStyle: TextStyle(color: Colors.white),
            chartValueBackgroundColor: Colors.transparent,
            showChartValuesInPercentage: false,
            showChartValues: false),
        totalValue: 10,
      ),
    );
  }
}
