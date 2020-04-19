import 'package:flutter/material.dart';
import 'Weather.dart';
import 'package:joseph_flutter/model/WeatherData.dart';
import 'package:joseph_flutter/api/MapApi.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WeatherData _weatherData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
//        body: Weather(),
      body: _weatherData != null ? Weather(weatherData: _weatherData) :
      Center(
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          valueColor: AlwaysStoppedAnimation(Colors.white),
        ),
      ),

    );
  }

  getCurrentLocation() {
    loadWeatherData(31.23, 121.47);
  }

  loadWeatherData(double lat, double lon) async {
    MapApi mapApi = MapApi.getInstance();
    final data = await mapApi.getWeather(lat: lat, lon: lon);
    print("*********-------");
    print(data);
    setState(() {
      this._weatherData = data;
      print(this._weatherData.name);
      print(this._weatherData.temp);
      print(this._weatherData.icon);
      print(this._weatherData.main);

    });
  }
}
