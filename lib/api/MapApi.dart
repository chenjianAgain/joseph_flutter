import 'package:http/http.dart' show Client;
import 'package:joseph_flutter/model/WeatherData.dart';

class MapApi {

  // Add your http://openweathermap.org api key here
  static const _apiKey = 'a6b604ea108bf107a5515fba51167bd1';
  static const _endpoint = 'http://api.openweathermap.org/data/2.5';
  double lat, lon;
  Client client = Client();

  static MapApi _instance;
  static MapApi getInstance() => _instance ??= MapApi();

  String _apiCall({double lat, double lon}) {
    String url = _endpoint + "/weather?lat=" + lat.toString() + "&lon=" + lon.toString() +
        "&APPID=" + _apiKey + "&units=metric";
    print(url);
    return url;
  }

  getWeather({double lat, double lon}) async {
    var response = await client.get(
      Uri.encodeFull(_apiCall(lat: lat, lon: lon)),
      headers: {
        'Accept': 'application/json'
      }
    );
    return WeatherData.deserialize(response.body);
  }

}