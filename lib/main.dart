import 'package:flutter/material.dart';
import 'package:flutter_first_app/pages/cart_page.dart';
import 'package:flutter_first_app/pages/home_page.dart';
import 'package:flutter_first_app/pages/login_page.dart';
import 'package:flutter_first_app/utils/routes.dart';
import 'package:flutter_first_app/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" : (context) => const LoginPage(),
        MyRoutes.loginRoute : (context) => const LoginPage(),
        MyRoutes.homeRoute :(context) => const HomePage(),
        MyRoutes.cartRoute :(context) => const CartPage(),
      },
    );
  }
}
