import 'package:covid/constants.dart';
import 'package:flutter/material.dart';

class DistrictDetails extends StatefulWidget {
  final districtData;

  DistrictDetails({@required this.districtData});

  @override
  _DistrictDetailsState createState() => _DistrictDetailsState();
}

class _DistrictDetailsState extends State<DistrictDetails> {
  List districtNames;
  @override
  void initState() {
    super.initState();
    districtNames = widget.districtData.keys.toList();
    districtNames.sort((a, b) => a.compareTo(b));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "State Details",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFffefe6),
        ),
        body: ListView.builder(
          itemCount: districtNames.length,
          itemBuilder: (BuildContext context, int index) => Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                districtNames[index] != 'Unknown'
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                districtNames[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Active: ${widget.districtData[districtNames[index]]['active']}",
                                style: kDistrictDetails,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Recovered: ${widget.districtData[districtNames[index]]['recovered']}",
                                style: kDistrictDetails,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Death: ${widget.districtData[districtNames[index]]['deceased']}",
                                style: kDistrictDetails,
                              ),
                            ),
                            Divider(
                              color: Colors.black54,
                            )
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
