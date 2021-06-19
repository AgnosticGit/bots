import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class DaysBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DaysBarChartState();
}

class _DaysBarChartState extends State<DaysBarChart> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);



  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: const Color(0xff2c4260),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    BarChartData(
                      maxY: 20,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (_a, _b, _c, _d) => null,
                        ),
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          margin: 20,
                          getTitles: (double value) {
                            switch (value.toInt()) {
                              case 1:
                                return 'Mn';
                              case 2:
                                return 'Te';
                              case 3:
                                return 'Wd';
                              case 4:
                                return 'Tu';
                              case 5:
                                return 'Fr';
                              case 6:
                                return 'St';
                              case 7:
                                return 'Sn';
                              default:
                                return '';
                            }
                          },
                        ),
                        leftTitles: SideTitles(
                          showTitles: true,
                          getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          margin: 32,
                          reservedSize: 14,
                          getTitles: (value) {
                            if (value == 0) {
                              return '1K';
                            } else if (value == 10) {
                              return '5K';
                            } else if (value == 19) {
                              return '10K';
                            } else {
                              return '';
                            }
                          },
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: _getBarGroups(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData>? _getBarGroups() {
    final barGroup1 = makeGroupData(1, 5, 12);

    return [
      barGroup1,
    ];
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          y: y1,
          colors: [leftBarColor],
          width: 10,
        ),
        BarChartRodData(
          y: y2,
          colors: [rightBarColor],
          width: 10,
        ),
      ],
    );
  }
}
