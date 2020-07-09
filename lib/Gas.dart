

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
import 'package:firebase_database/firebase_database.dart';




class GasSensor extends StatefulWidget {
    final Widget child;
    

  GasSensor({Key key, this.child}) : super(key: key);

  _GasSensorState createState() => _GasSensorState();
}

class _GasSensorState extends State<GasSensor> {
  List<charts.Series<Sensors, num>> _seriesDataCO;
  List<charts.Series<Sensors, num>> _seriesDataLPG;
  List<charts.Series<Sensors, num>> _seriesDataSmoke;
  _generateData() {
  var dataCO = [
      new Sensors(1, 1875),
      new Sensors(2, 2500),
      new Sensors(3, 1900),
      new Sensors(4, 1500),
      new Sensors(5, 2900),
      new Sensors(6, 1100),
      new Sensors(7, 1700),
      new Sensors(8, 1200),
      new Sensors(9, 300),
      new Sensors(10, 2800),
      new Sensors(11, 2000),
      new Sensors(12, 2200),
    ];
    var dataLPG = [
      new Sensors(1, 90),
      new Sensors(2, 400),
      new Sensors(3, 3000),
      new Sensors(4, 3597),
      new Sensors(5, 4678),
      new Sensors(6, 3345),
      new Sensors(7, 3653),
      new Sensors(8, 2679),
      new Sensors(9, 2987),
      new Sensors(10, 4768),
      new Sensors(11, 1900),
      new Sensors(12, 2407),
    ];
    var dataSmoke = [
      new Sensors(1, 3000),
      new Sensors(2, 2500),
      new Sensors(3, 2978),
      new Sensors(4, 3057),
      new Sensors(5, 3789),
      new Sensors(6, 4578),
      new Sensors(7, 2100),
      new Sensors(8, 4987),
      new Sensors(9, 3307),
      new Sensors(10, 2300),
      new Sensors(11, 3489),
      new Sensors(12, 2790),
    ];
    _seriesDataCO.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2020',
        data: dataCO,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
    _seriesDataLPG.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2021',
        data: dataLPG,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
    _seriesDataSmoke.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2022',
        data: dataSmoke,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesDataCO = List<charts.Series<Sensors, num>>();
    _seriesDataLPG = List<charts.Series<Sensors, num>>();
    _seriesDataSmoke = List<charts.Series<Sensors, num>>();
    
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
                  'Gas ',
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
                                'CO    ',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: charts.LineChart(_seriesDataCO,
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
                               Text(
                                'LPG    ',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: charts.LineChart(_seriesDataLPG,
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
                               Text(
                                'Smoke    ',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: charts.LineChart(_seriesDataSmoke,
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

 


