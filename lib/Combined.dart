import 'dart:io';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutteranimatedchartsapp/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './iconButton.dart';

class CombinedGraph extends StatefulWidget {
  final Widget child;

  CombinedGraph({Key key, this.child}) : super(key: key);

  _CombinedGraphState createState() => _CombinedGraphState();
}

class _CombinedGraphState extends State<CombinedGraph> {
  List<charts.Series<Sensors, String>> _seriesData;
  
  // List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var data1 = [
      new Sensors('Jan', 10),
      new Sensors('Feb', 15),
      new Sensors('Mar', 29),
      new Sensors('Apr', 31),
      new Sensors('May', 30),
      new Sensors('Jun', 35),
      new Sensors('Jul', 39),
      new Sensors('Aug', 34),
      new Sensors('Sept', 28),
      new Sensors('Oct', 27),
      new Sensors('Nov', 21),
      new Sensors('Dec', 16),
    ];
    var data2 = [
      new Sensors('Jan', 0),
      new Sensors('Feb', 0),
      new Sensors('Mar', 1),
      new Sensors('Apr', 0),
      new Sensors('May', 1),
      new Sensors('Jun', 1),
      new Sensors('Jul', 1),
      new Sensors('Aug', 1),
      new Sensors('Sept', 0),
      new Sensors('Oct', 0),
      new Sensors('Nov', 1),
      new Sensors('Dec', 0),
    ];
    var data3 = [
      new Sensors('Jan', 30),
      new Sensors('Feb', 40),
      new Sensors('Mar', 10),
      new Sensors('Apr', 20),
      new Sensors('May', 25),
      new Sensors('Jun', 35),
      new Sensors('Jul', 45),
      new Sensors('Aug', 55),
      new Sensors('Sept', 60),
      new Sensors('Oct', 15),
      new Sensors('Nov', 25),
      new Sensors('Dec', 10),
    ];
     var data = [
      new Sensors('Jan', 40),
      new Sensors('Feb', 47),
      new Sensors('Mar', 19),
      new Sensors('Apr', 25),
      new Sensors('May', 44),
      new Sensors('Jun', 65),
      new Sensors('Jul', 5),
      new Sensors('Aug', 65),
      new Sensors('Sept', 30),
      new Sensors('Oct', 12),
      new Sensors('Nov', 35),
      new Sensors('Dec', 20),
    ];

    

    _seriesData.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2018',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2019',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff109618)),
      ),
    );

    _seriesData.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2020',
        data: data3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
    _seriesData.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2021',
        data: data,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xff990099)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Sensors, String>>();
    
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
        accentColor: Colors.cyan[600],
      ),
      home: DefaultTabController(
        length: 3,
        
                  child: Scaffold(
            
            
            appBar: AppBar(
              automaticallyImplyLeading: false,
                //`true` if you want Flutter to automatically add Back Button when needed,
                //or `false` if you want to force your own back button every where
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed:() => runApp(ImageButton()),
                  //onPressed: () => exit(0),
                ),
                backgroundColor: Colors.pink,
                
                title: Center(
                  child: Text(
                    'RTSPS  ',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
                ),
            body: Column (
                children: [
                  
                  SizedBox(
                    height: 600,
                                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Graphs of all sensors',
                                style: TextStyle(
                                    fontSize: 24.0, fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: charts.BarChart(
                                  _seriesData,
                                  animate: true,
                                  barGroupingType: charts.BarGroupingType.grouped,
                                  //behaviors: [new charts.SeriesLegend()],
                                  animationDuration: Duration(seconds: 2),
                                ),
                              ),
                            ],
                          ),
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
}

class Sensors {
  String month;

  int reading;

  Sensors(this.month, this.reading);
}


