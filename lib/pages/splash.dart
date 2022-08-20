
import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/home_page.dart';
import 'package:flutter_first_app/utils/routes.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }

  _navigatehome() async{
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushNamed(this.context, MyRoutes.loginRoute);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: const Text("Splash Screen", style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold,
          ),),
        ),
      ),
    );
  }
}