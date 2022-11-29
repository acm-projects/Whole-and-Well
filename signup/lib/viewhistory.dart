import 'package:flutter/material.dart';
import 'globalvar.dart' as globals;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'main.dart';

void main() => runApp( MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ViewHistory(),
),
);

class ViewHistory extends StatefulWidget{
  const ViewHistory({super.key});
  @override
  ViewHistoryState createState() => ViewHistoryState();
}

class ViewHistoryState extends State<ViewHistory> {
  late List<BarChart> _chartData;
  @override
  void initState(){
    _chartData = getChartData();
    super.initState();
  }
  List<BarChart> getChartData(){
    final List<BarChart> chartData =[
      BarChart("Before", globals.currentSliderValue),
      BarChart("After", globals.finalSliderValue)
    ];
    return chartData;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffffff),
        centerTitle:true,
        title: const Text("View History",
          style: TextStyle(fontSize: 24, color: Color(0xFF000000), fontFamily: 'Inter',
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF000000)),
          onPressed: () { Navigator.push(context,
              MaterialPageRoute(builder: (context) => navBar())
          ); },),
      ),
      body: Center(
        child: Container(
          height: 500,
          width: MediaQuery.of(context).size.width*0.85,
          decoration: const BoxDecoration(
            color:Color(0xFF656CCA),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0,30.0,15.0,15.0),
            child: SfCartesianChart(
              title: ChartTitle(text: 'Mood before and after workout', textStyle:const TextStyle(color:Colors.black, fontSize: 20.0)),
              plotAreaBackgroundColor: const Color(0xFFD3D3D3),
              series: <ChartSeries>[
                BarSeries<BarChart, String>(dataSource: _chartData,
                  xValueMapper: (BarChart data,_)=>data.time,
                  yValueMapper: (BarChart data,_)=> data.slider,
                  //dataLabelSettings: DataLabelSettings(isVisible: true)
                ),
              ],
              primaryXAxis: CategoryAxis(labelStyle: const TextStyle(color: Colors.black,fontFamily: '',fontSize: 15)),
              primaryYAxis: NumericAxis(labelStyle: const TextStyle(color: Colors.black,fontFamily: '',fontSize: 20), edgeLabelPlacement: EdgeLabelPlacement.shift),
              palette: const <Color>[
                Color(0xFF8F93CF),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

class BarChart{
  final String time;
  final double slider;
  BarChart(this.time, this.slider);
}