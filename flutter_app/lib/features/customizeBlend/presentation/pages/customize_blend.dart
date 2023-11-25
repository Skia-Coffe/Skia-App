import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:skia_coffee/core/constants/assets_images.dart';
import 'package:skia_coffee/core/constants/colors.dart';
import 'package:skia_coffee/features/customizeBlend/data/models/coffee_bendchart_model.dart';

class CustomizeCoffeeBlend extends StatefulWidget {
  const CustomizeCoffeeBlend({super.key});

  @override
  State<CustomizeCoffeeBlend> createState() => _CustomizeCoffeeBlendState();
}

class _CustomizeCoffeeBlendState extends State<CustomizeCoffeeBlend> {
  late List<ChartData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  Map<String, double> dataMap = {
    "Arabica": 10,
    "Robusta": 10,
    "Robuska": 10,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                color: textColor,
              ),
              Image(image: AssetImage(icLogo)),
              Icon(
                Icons.shopping_bag_outlined,
                color: textColor,
              ),
            ],
          ),
        ),
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
        toolbarHeight: 60,
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                child: PieChart(
                  dataMap: dataMap,
                  colorList: [textColor, appBarbg, appBarbg],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<ChartData> getChartData() {
  final List<ChartData> _chartData = [
    ChartData("Arabica", 10, textColor),
    ChartData("Robusta", 10, appBarbg),
    ChartData("Robusta", 10, appBarbg),
  ];
  return _chartData;
}
// SfCircularChart(
//                   series: <CircularSeries>[
//                     PieSeries<ChartData, String>(
//                       dataSource: _chartData,
//                       xValueMapper: (ChartData data, _) => data.type,
//                       yValueMapper: (ChartData data, _) => data.quantity,
//                       dataLabelSettings:
//                           const DataLabelSettings(isVisible: true),
//                       dataLabelMapper: (ChartData data, _) => '${data.type}',
//                     ),
//                   ],
//                 ),