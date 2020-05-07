import 'package:flutter/material.dart';
import '../constants.dart';
import '../heading_container.dart';
import 'second_page.dart';
import 'loading_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                HeadingContainer(
                  widgetChild: Text(
                    "Be Aware",
                    style: kHeadingStyle,
                  ),
                ),
                HeadingContainer(
                  widgetChild: Text(
                    "From COVID-19",
                    style: kHeadingStyle,
                  ),
                ),
                HeadingContainer(
                  widgetChild: Text(
                    "Keep Yourself Home Quarantined",
                    style: kHomeSuggestion,
                  ),
                ),
              ],
            ),
            Image.asset(
              'images/doctor.png',
            ),
            Container(
              margin: EdgeInsets.only(
                left: 40.0,
                right: 40.0,
              ),
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: RaisedButton(
                  color: Color(0xFFe8e8e8),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen()));
                  },
                  padding: EdgeInsets.all(
                    20.0,
                  ),
                  child: Text(
                    "Get More Info",
                    style: kButtonStyle,
                  ),
                  elevation: 16.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
