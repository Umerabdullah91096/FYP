import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutteranimatedchartsapp/Combined.dart';
import 'package:flutteranimatedchartsapp/Individual.dart';
import './homepage.dart';
import 'dart:io';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutteranimatedchartsapp/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './iconButton.dart';
import './Individual.dart';


class FlameSensor extends StatefulWidget {
    final Widget child;

  FlameSensor({Key key, this.child}) : super(key: key);

  _FlameSensorState createState() => _FlameSensorState();
}

class _FlameSensorState extends State<FlameSensor> {
  List<charts.Series<Sensors, num>> _seriesData2;
  _generateData() {
   var data2 = [
      new Sensors(1, 30),
      new Sensors(2, 20),
      new Sensors(3, 40),
      new Sensors(4, 50),
      new Sensors(5, 25),
      new Sensors(6, 65),
      new Sensors(7, 45),
      new Sensors(8, 75),
      new Sensors(9, 200),
      new Sensors(10, 151),
      new Sensors(11, 252),
      new Sensors(12, 101),
    ];
    _seriesData2.add(
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
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData2 = List<charts.Series<Sensors, num>>();
    
    _generateData();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
              //`true` if you want Flutter to automatically add Back Button when needed,
              //or `false` if you want to force your own back button every where
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed:() => runApp(IndividualGraph()),
                //onPressed: () => exit(0),
              ),
              backgroundColor: Colors.pink,
              
              title: Center(
                child: Text(
                  'Flame ',
                  style: TextStyle(
                      fontSize: 35,
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
                                'Flame ',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: charts.LineChart(_seriesData2,
                                    defaultRenderer:
                                        new charts.LineRendererConfig(
                                            includeArea: true, stacked: true),
                                    animate: true,
                                    animationDuration: Duration(seconds: 2),
                                    behaviors: [
                                      new charts.ChartTitle('Months',
                                          behaviorPosition:
                                              charts.BehaviorPosition.bottom,
                                          titleOutsideJustification: charts
                                              .OutsideJustification
                                              .middleDrawArea),
                                      new charts.ChartTitle('Range',
                                          behaviorPosition:
                                              charts.BehaviorPosition.start,
                                          titleOutsideJustification: charts
                                              .OutsideJustification
                                              .middleDrawArea),
                                    ]),
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
  int month;

  int reading;

  Sensors(this.month, this.reading);
}