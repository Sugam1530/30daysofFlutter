import 'package:flutter/material.dart';
import 'package:flutter_first_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';


class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar( 
      title: "Cart".text.black.xl3.make().pOnly(left: 64),
      ),
    );
    
  }
}