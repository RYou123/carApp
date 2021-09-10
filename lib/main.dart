import 'package:carApp/models/database.dart';
import 'package:carApp/widgets/cars_grid.dart';
import 'package:flutter/material.dart';
import 'package:carApp/models/cars.dart';
import 'package:carApp/models/database.dart';

void main() {
  String myurl = Uri.base.toString(); //get complete url
  String para1 = Uri.base
      .queryParameters["start_date"]; //get parameter with attribute "para1"
  String para2 = Uri
      .base.queryParameters["end_date"]; //get parameter with attribute "para2"
  String para3 = Uri
      .base.queryParameters["location"]; //get parameter with attribute "para2"

  runApp(MyApp(myurl: myurl, para1: para1, para2: para2, para3: para3));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  String myurl, para1, para2, para3;
  MyApp({this.myurl, this.para1, this.para2, this.para3});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interent Car Rental',
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interent Car Rental"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text("Start date"),
              ),
              Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
              ElevatedButton(
                onPressed: () {
                  _selectDate2(context);
                },
                child: Text("End date"),
              ),
              Text(
                  "${selectedDate2.day}/${selectedDate2.month}/${selectedDate2.year}"),
              CarsGrid(start: selectedDate, end: selectedDate2)
            ]),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate2,
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate2)
      setState(() {
        selectedDate2 = selected;
      });
  }
}
