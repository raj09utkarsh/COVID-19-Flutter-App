import 'package:flutter/material.dart';
import 'constants.dart';

class HeadingContainer extends StatelessWidget {
  final Widget widgetChild;
  HeadingContainer({@required this.widgetChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10.0,
        left: 20.0,
        bottom: 10.0,
        right: 5.0,
      ),
      child: widgetChild,
    );
  }
}
