import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'second_page.dart';
import '../current_cases.dart';
import 'dart:io';

const spin = Scaffold(
  body: SpinKitWave(
    color: Colors.white,
    size: 50.0,
  ),
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var url = 'https://api.covid19india.org/data.json';
  var activeCases;
  var recoveredCases;
  var deaths;
  int connectionStatus = 0;

  var currentWidget = spin;

  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      } else {
        this.connectionStatus = 2;
      }
    } on SocketException catch (_) {
      this.connectionStatus = 1;
    }
  }

  Future<void> getCurrentStatus() async {
    await checkConnection();
    if (connectionStatus != 0) {
      setState(() {
        currentWidget = Scaffold(
          body: AlertDialog(
            title: Text('Not connected to internet'),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      });

      return null;
    }
    CurrentCases cases = CurrentCases();

    await cases.getCurrentData();

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondPageHome(
                  cases: cases,
                )));
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    getCurrentStatus();
  }

  Widget getWidget() {
    if (connectionStatus == 0) {
      return spin;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: currentWidget,
    );
  }
}
