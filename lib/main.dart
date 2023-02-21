// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key ? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  String year="";
  String dayNum="";
  String month="";
  String dayWeek="";
  int hours=0;
  String minutes="";
  String secands="";
  String pmORam="am";


  changeEverySec(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        year=DateTime.now().year.toString();
        month=DateTime.now().month.toString();
        switch (month) {
          case "1":
            month="january";
            break;
          case "2":
            month="February";
            break;
          case "3":
            month="March";
            break;
          case "4":
            month="April";
            break;
          case "5":
            month="May";
            break;
          case "6":
            month="June";
            break;
          case "7":
            month="July";
            break; 
          case "8":
            month="Agust";
            break;
          case "9":
            month="septemper";
            break;
          case "10":
            month="Octoper";
            break; 
          case "11":
            month="November";
            break;        
          case "12":
            print("December");
            break; 
        }
        dayNum=DateTime.now().day.toString();
        hours=DateTime.now().hour;
        if(hours>12){
          hours=hours-12;
          pmORam="pm";
        }
        minutes=DateTime.now().minute.toString();
        secands=DateTime.now().second.toString();
        dayWeek=DateTime.now().weekday.toString();
          switch (dayWeek) {
          case "1":
            dayWeek="monday";
            break;
          case "2":
            dayWeek="Tuesday";
            break;
          case "3":
            dayWeek="wednesday";
            break;
          case "4":
            dayWeek="thursday";
            break;
          case "5":
            dayWeek="Friday";
            break;
          case "6":
            dayWeek="saturday";
            break;
          case "7":
            dayWeek="sunday";
            break; 
        }
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time & Date App",style: TextStyle(fontSize: 27),),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Today's Date is $dayWeek",style: TextStyle(fontSize: 27, color: Colors.white),),
            SizedBox(height: 22,),
            Text("$month $dayNum ,$year",style: TextStyle(fontSize: 27, color: Colors.white),),
            SizedBox(height: 22,),
            Text("${hours.toString().padLeft(2,"0")}:${minutes.padLeft(2,"0")}:${secands.padLeft(2,"0")} $pmORam",style: TextStyle(fontSize: 27, color: Colors.white),),
            
          ],
        ),
      ),
    );
  }
}