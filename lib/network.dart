import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String baURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

  getTickerData(String cryCurr, String fiatCurr) async {
    var btcURL = '$baURL$cryCurr$fiatCurr';

    http.Response response = await http.get(btcURL);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
