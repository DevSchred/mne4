// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
// import 'chart_model.dart';


// class ChartWidget extends StatefulWidget {
//   const ChartWidget({Key? key}) : super(key: key);
//   @override
//   _ChartWidgetState createState() => _ChartWidgetState();
// }

// class _ChartWidgetState extends State<ChartWidget> {
  
//   List<RadialData> data = [
//     RadialData('Projects', 3),
//     RadialData('Activities', 3),
//     RadialData('Tasks', 4)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column( children:[ SfCircularChart(
//       title: ChartTitle(text: 'Projects'),
//       legend: Legend(isVisible: true),
//       series:<CircularSeries<RadialData, String>>[
//         CircularSeries<RadialData, String>(
//           enableTooltip: true,
//           dataSource:data,
//           xValueMapper: (RadialData data, _) => data.x,
//           yValueMapper: ,
//          dataLabelMapper:,
//           radius: '80%',
//           innerRadius: '60%',
//           startAngle: 0,
//           endAngle: 360,
//          cornerStyle: CornerStyle.bothCurve
//         ),
//       ],
//     ),
//     Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               //Initialize the spark charts widget
//               child: SfSparkLineChart.custom(
//                 //Enable the trackball
//                 trackball: const SparkChartTrackball(
//                     activationMode: SparkChartActivationMode.tap),
//                 //Enable marker
//                 marker: const SparkChartMarker(
//                     displayMode: SparkChartMarkerDisplayMode.all),
//                 //Enable data label+
//                 labelDisplayMode: SparkChartLabelDisplayMode.all,
//                 xValueMapper: (int index) => data[index].xData,
//                 yValueMapper: (int index) => data[index].yData,
//                 dataCount: 5,
//               ),
//             ),
//           )
//     ]);
// }
// }