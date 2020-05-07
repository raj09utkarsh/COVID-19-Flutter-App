import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../case_card_detail.dart';
import 'symptoms.dart';
import 'district_details.dart';

class SecondPageHome extends StatefulWidget {
  final cases;
  SecondPageHome({@required this.cases});
  @override
  _SecondPageHomeState createState() => _SecondPageHomeState();
}

class _SecondPageHomeState extends State<SecondPageHome> {
  var activeCases;
  var recoveredCases;
  var deaths;
  String lastUpdatedTime;
  List stateData;
  var stateDistrictData;

  @override
  void initState() {
    super.initState();
    activeCases = widget.cases.activeCases;
    recoveredCases = widget.cases.recoveredCases;
    deaths = widget.cases.deaths;
    lastUpdatedTime = widget.cases.lastUpdated;
    stateData = widget.cases.stateWiseData;
    stateDistrictData = widget.cases.stateDistrictData;
  }

  List<Widget> _createChildren() {
    return new List<Widget>.generate(stateData.length, (int index) {
      return Card(
        margin: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 5.0,
          bottom: 5.0,
        ),
        child: Container(
          margin: EdgeInsets.only(
            left: 20.0,
            right: 10.0,
          ),
          child: ExpansionTile(
            title: Text(
              stateData[index]['state'].toString(),
              style: kStateCardHeadingStyle,
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Active: ",
                        style: kCardTitle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        stateData[index]['active'],
                        style: kCardTitle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Recovered: ",
                        style: kCardTitle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        stateData[index]['recovered'],
                        style: kCardTitle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Deaths: ",
                        style: kCardTitle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        stateData[index]['deaths'],
                        style: kCardTitle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 40.0),
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DistrictDetails(
                                    districtData: stateDistrictData[
                                        stateData[index]['state']
                                            .toString()]['districtData'],
                                  )));
                    },
                    child: Text(
                      "See More",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid',
      home: Scaffold(
        backgroundColor: Color(0xFFf0f2f0),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    color: Color(0xFFffefe6),
                    elevation: 10.0,
                    child: Container(
                      child: Center(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Image.asset(
                                  'images/mask.png',
                                  alignment: Alignment.bottomLeft,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right: 10.0,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "5 Symptoms of",
                                        style: kCardHeaderStyle,
                                      ),
                                      Text(
                                        "COVID-19",
                                        style: kCardHeaderStyle,
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          bottom: 10.0,
                                        ),
                                        child: RaisedButton(
                                          color: Color(0xFF232b23),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Symptoms()));
                                          },
                                          padding: EdgeInsets.all(
                                            13.0,
                                          ),
                                          child: Text(
                                            "Read More",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          elevation: 16.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20.0,
                      bottom: 15.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Text(
                      "COVID-19 Latest Update",
                      style: kCardHeaderStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Last Updated: $lastUpdatedTime',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            fontSize: 15.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        CaseDetailCard(
                          heading: "Active Cases",
                          totalCases: activeCases.toString(),
                          icon: FontAwesomeIcons.plusCircle,
                        ),
                        CaseDetailCard(
                          heading: "Recovered",
                          totalCases: recoveredCases,
                          icon: FontAwesomeIcons.heart,
                        ),
                        CaseDetailCard(
                          heading: "Deaths",
                          totalCases: deaths,
                          icon: FontAwesomeIcons.times,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                    child: Text(
                      "State Wise Data",
                      style: kCardHeaderStyle,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _createChildren(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
