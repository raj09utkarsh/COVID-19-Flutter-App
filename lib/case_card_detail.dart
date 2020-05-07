import 'package:flutter/material.dart';
import 'constants.dart';

class CaseDetailCard extends StatelessWidget {
  final String heading;
  final String totalCases;
  final IconData icon;

  CaseDetailCard(
      {@required this.heading, @required this.totalCases, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(icon),
          Text(
            heading,
            style: kCardDetailStyle,
          ),
          Text(
            totalCases,
            style: kCasesNumberStyle,
          ),
        ],
      ),
      margin: EdgeInsets.all(10.0),
      height: 130.0,
      width: 130.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFFc9c9b9),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 12.0,
          ),
        ],
      ),
    );
  }
}
