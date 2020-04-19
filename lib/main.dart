import 'package:flutter/material.dart';
import 'model/post.dart';
import 'package:joseph_flutter/ui/MyHomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage(title: 'Flutter'),
        theme: ThemeData(
          primarySwatch: Colors.blue
        )
    );
  }
}
