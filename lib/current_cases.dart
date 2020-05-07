import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrentCases {
  var activeCases;
  var recoveredCases;
  var deaths;
  var lastUpdated;

  List stateWiseData;
  var stateDistrictData;

  var url = 'https://api.covid19india.org/data.json';

  Future<void> getCurrentData() async {
    http.Response response = await http.get(url);
    var data = jsonDecode(response.body);
    var total = data['statewise'][0];
    activeCases = total['active'];
    recoveredCases = total['recovered'];
    deaths = total['deaths'];
    lastUpdated = total['lastupdatedtime'];
    stateWiseData = data['statewise'];
    stateWiseData.removeAt(0);

    response = await http
        .get('https://api.covid19india.org/state_district_wise.json')
        .timeout(Duration(seconds: 4));

    data = jsonDecode(response.body);
    stateDistrictData = data;

    stateWiseData.sort((a, b) => a['state'].compareTo(b['state']));

//    print(stateWiseData[1]);
  }
}
