import 'package:flutter/material.dart';
import 'package:flutter_first_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';


class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog}) :assert(catalog != null) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App",
        style: const TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
          "\$${catalog.price}".text.bold.xl4.red800.make().pOnly(left: 20),
          ElevatedButton(onPressed: () {}, 
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
            shape: MaterialStateProperty.all(StadiumBorder())
            ),
            child: "Buy".text.xl.make()).pOnly(right: 20).wh(100,50)
          ],
        ).p8(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image).centered()
            ).h32(context).p8(),
            Expanded(child: Container(
              child: VxArc(
                height: 20.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl.color(MyTheme.darkBluishColor).bold.make().pOnly(top: 16),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make().py8(),
                    ],
                  ).py32(),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}