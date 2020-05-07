import 'package:covid/constants.dart';
import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFf0f2f0),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: Card(
                elevation: 8.0,
                color: Color(0xFFdeffea),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Here are 5 symptoms of COVID-19",
                        style: kSymptomStyle,
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      SymptomsContainer(
                        symptom: "Are you having high fever?",
                      ),
                      SymptomsContainer(
                        symptom: "Are you having sore throat?",
                      ),
                      SymptomsContainer(
                        symptom: "Are you having dry cough?",
                      ),
                      SymptomsContainer(
                        symptom: "Are you having difficulty in breathing?",
                      ),
                      SymptomsContainer(
                        symptom: "Are you having loss of taste?",
                      ),
                      SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Do Consult A Doctor If You Have Any Of Them",
                          style: kConsultDoctor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SymptomsContainer extends StatelessWidget {
  final String symptom;
  SymptomsContainer({@required this.symptom});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 5.0,
        bottom: 5.0,
      ),
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            symptom,
            style: kSymptomCardList,
          ),
        ),
      ),
    );
  }
}
