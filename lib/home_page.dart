import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double days = 30;
    final String name = "Sugam Looser";
    bool isMale = true;
    num temp = 30.5;

    var day = "Tuesday";
    const pi = 3.14;
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of Flutter by $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}