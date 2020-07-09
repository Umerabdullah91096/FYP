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


class DustSensor extends StatefulWidget {
    final Widget child;

  DustSensor({Key key, this.child}) : super(key: key);

  _DustSensorState createState() => _DustSensorState();
}

class _DustSensorState extends State<DustSensor> {
 List<charts.Series<Sensors, num>> _seriesData;
  _generateData() {
   var data = [
      new Sensors(1, 1.167),
      new Sensors(2, 0.493),
      new Sensors(3, 0.069),
      new Sensors(4, 0.083),
      new Sensors(5, 1.245),
      new Sensors(6, 0.034),
      new Sensors(7, 0.452),
      new Sensors(8, 0.653),
      new Sensors(9, 0.097),
      new Sensors(10, 0.197),
      new Sensors(11, 0.469),
      new Sensors(12, 0.389),
    ];
    _seriesData.add(
      charts.Series(
        domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: '2021',
        data: data,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Sensors sensors, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<Sensors, num>>();
    
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
                  'Dust & Smoke  ',
                  style: TextStyle(
                      fontSize: 30,
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
                                'Dust ',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: charts.LineChart(_seriesData,
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

  double reading;

  Sensors(this.month, this.reading);
}