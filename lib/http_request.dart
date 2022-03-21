import 'dart:convert' as convert;
import 'models/private_key.dart';
import 'package:http/http.dart' as http;

Future<void> getSeries({required String ticker}) async {
  String key = privateKey;

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(
    Uri.parse(
        'https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=IBM&interval=5min&apikey=$key'),
  );
  if (response.statusCode == 200) {
    try {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['Time Series (5min)'].forEach((String key, value) {
        Map<String, dynamic> map = {key: value};
      }); // add the series model
    } catch (e) {
      print(e.toString());
    }
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
