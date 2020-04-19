import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:joseph_flutter/model/WeatherData.dart';

class Weather extends StatelessWidget {

  final WeatherData weatherData;
  Weather({@required this.weatherData});

  @override
  Widget build(BuildContext context) {
    Widget dateSection = Container(
      child: Text(
        DateFormat('MMMM d, HH:mm').format(DateTime.now()),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 24
        ),
      ),
    );

    Widget tempSection = Container(
      padding: EdgeInsets.symmetric(
        vertical: 10
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            weatherData.temp.toStringAsFixed(0),
            style: TextStyle(
              fontWeight: FontWeight.bold,
//              color: Colors.white,
              fontSize: 80
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 12.0
              ),
              margin: EdgeInsets.only(
                left: 6.0
              ),
              child: Text(
                '\u2103',
                style: TextStyle(
//                  color: Colors.white,
                  fontSize: 24
                )
              ),
            ),
          ),
          Image.network(
            'https://openweathermap.org/img/w/${weatherData.icon}.png',
            //'assets/images/cloudy.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          )
        ],
      )
    );

    Widget descSection = Container(
//        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                weatherData.name,
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 24
                )
            ),
            Text(
                weatherData.main,
                style: TextStyle(
                  color: Colors.white,
                    fontSize: 24
                )
            ),
          ],
        )
    );

    return Container(
      padding: const EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          dateSection,
          tempSection,
          descSection
          ],
      ),
    );
  }


}
