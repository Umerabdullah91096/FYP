import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutteranimatedchartsapp/Dust.dart';
import 'package:flutteranimatedchartsapp/Flame.dart';
import 'package:flutteranimatedchartsapp/Gas.dart';
import './Temp.dart';
import 'homepage.dart';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutteranimatedchartsapp/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './iconButton.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class IndividualGraph extends StatefulWidget {
  final Widget child;

  IndividualGraph({Key key, this.child}) : super(key: key);

  _IndividualGraphState createState() => _IndividualGraphState();
}

class _IndividualGraphState extends State<IndividualGraph> {
  List<charts.Series<Sensors, num>> _seriesData1;
  List<charts.Series<Sensors, num>> _seriesData2;
  List<charts.Series<Sensors, num>> _seriesData3;
  List<charts.Series<Sensors, num>> _seriesData;

  _generateData() {
    var data1 = [
      new Sensors(1, 30),
      new Sensors(2, 40),
      new Sensors(3, 10),
      new Sensors(4, 20),
      new Sensors(5, 25),
      new Sensors(6, 35),
      new Sensors(7, 45),
      new Sensors(8, 55),
      new Sensors(9, 60),
      new Sensors(10, 15),
      new Sensors(11, 25),
      new Sensors(12, 10),
    ];
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
    var data3 = [
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

    _seriesData1.add(
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

    _seriesData3.add(
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
            charts.ColorUtil.fromDartColor(Color(0xffff9900)),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData1 = List<charts.Series<Sensors, num>>();
    _seriesData2 = List<charts.Series<Sensors, num>>();
    _seriesData3 = List<charts.Series<Sensors, num>>();
    _seriesData = List<charts.Series<Sensors, num>>();
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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                automaticallyImplyLeading: false,
                //`true` if you want Flutter to automatically add Back Button when needed,
                //or `false` if you want to force your own back button every where
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => runApp(ImageButton()),
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
            ),
            body: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverAppBar(
                  
                  backgroundColor: Colors.grey[50],
                  title: Text(
                    'Shown graphs of 4 different sensors',
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                        
                  ),
                  
                  // Allows the user to reveal the app bar if they begin scrolling back
                  // up the list of items.
                  floating: false,
                  // Display a placeholder widget to visualize the shrinking size.
                  // flexibleSpace: Placeholder(),
                  // Make the initial height of the SliverAppBar larger than normal.
                  expandedHeight: 80,
                ),
                SliverPadding(
                  padding: EdgeInsets.all(5),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        //constraints: BoxConstraints.expand(),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Temp & Humidity ',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: charts.LineChart(_seriesData1,
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
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Flame',
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
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Gas',
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: charts.LineChart(_seriesData3,
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
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Dust & Smoke',
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
                    ],
                  ),
                ),
                 SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            child: Text('       Temp             Flame             Home              Gas                Dust',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
            
          ),
        ),
                
              ],
            ),
            bottomNavigationBar: CurvedNavigationBar(backgroundColor: Colors.deepOrange,
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            height: 50,
            items: [
              Icon(Icons.equalizer,size:20,color:Colors.black)
              ,
              Icon(Icons.equalizer,size:20,color:Colors.black)
              ,
              Icon(Icons.home,size:20,color:Colors.black),

              Icon(Icons.equalizer,size:20,color:Colors.black)
              ,
              Icon(Icons.equalizer,size:20,color:Colors.black)
              ,
              
            ],
            animationDuration: Duration(milliseconds: 200),
            index: 2,
            animationCurve: Curves.bounceInOut,
            onTap: (index){
              if (index==0)
              {
                runApp(TempSensor());
              }
              if(index==1)
              {
                runApp(FlameSensor());
              }
              else if(index==2)
              {
                runApp(ImageButton());
              }
              else if(index==3)
              {
                runApp(GasSensor());
              }
              else if(index==4)
              {
                runApp(DustSensor());
              }
            },
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
