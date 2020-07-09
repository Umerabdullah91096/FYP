import 'dart:async';

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
import 'package:flutter_icons/flutter_icons.dart';
import 'package:marquee/marquee.dart';
import 'package:wave_progress_widget/wave_progress_widget.dart';
import './DHT22.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';



class TempSensor extends StatefulWidget {
    final Widget child;

  TempSensor({Key key, this.child}) : super(key: key);

  _TempSensorState createState() => _TempSensorState();
}

class _TempSensorState extends State<TempSensor> {
  
 List<charts.Series<dynamic, dynamic>> _seriesData;
  final fb = FirebaseDatabase.instance;
   
  
 /* DatabaseReference _dhtRef =
      FirebaseDatabase.instance.reference().child('DHT22');*/
     // final FirebaseDatabase database = FirebaseDatabase.getInstance();
//DatabaseReference _dhtRef = FirebaseDatabase.instance.reference();
   
    Widget build(BuildContext context) {
      final ref=fb.reference();
     
  
    time.add(DateTime.now());
    

    ref.child("DHT22").child("Humidity").onChildAdded.listen((event){
      var snapshot=event.snapshot;
    
        setState(() {
          dht.add(snapshot.value);
        });
        
                                
      });
     
      
      _generateData() {
    
    _seriesData = List<charts.Series<Sensors, num>>();
    
    _seriesData.add(
      
      charts.Series(
         domainFn: (Sensors sensors, _) => sensors.month,
        measureFn: (Sensors sensors, _) => sensors.reading,
        id: 'Reading',
        data: dht,
      ),
    );
  }
  
    
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
                  'Temperature & Humidity  ',
                  style: TextStyle(
                      fontSize: 25,
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
                  height: 400,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Center(
    
                       child: Column(
                            children: <Widget>[
                              Text(
                                'Humidity  ',
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
     

  
  
    
    
    //return  mainScaffold();
  

    /*  Widget mainScaffold() {
    return Scaffold(
      
         
       
                 
                   
      );
  }*/


  


  /*List<charts.Series<DHT22, int>> _seriesData;
  List<DHT22> mydata;
  DatabaseReference _dhtRef =
      FirebaseDatabase.instance.reference().child('DHT22');
  _generateData(mydata) {
    
    _seriesData = List<charts.Series<DHT22, int>>();
    _seriesData.add(
      charts.Series(
        domainFn: (DHT22 dht22, _) => dht22.month,
        measureFn: (DHT22 dht22, _) => dht22.reading,
        
        id: 'Reading',
        data: mydata,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reading')),
      body: _buildBody(context),
    );
  }
  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: _dhtRef.onValue,
                builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<DHT22> dht22 = snapshot.data.documents
              .map((documentSnapshot) => DHT22.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, dht22);
        }
      },
    );
  }
   Widget _buildChart(BuildContext context, List<DHT22> tempdata) {
    mydata = tempdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Temperature',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
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
    );
  }
}*/
   
  /*@override
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
                  'Temperature & Humidity  ',
                  style: TextStyle(
                      fontSize: 25,
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
                                'Temperature  ',
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
                              Text(
                                'Humidity  ',
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
}*/
class Sensors {
  List <num>dht=;
     
     
    List<DateTime> time;
    time=new List<DateTime>();

  Sensors(this.month, this.reading);
}






