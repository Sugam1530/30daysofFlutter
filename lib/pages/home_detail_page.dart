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
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
          "\$${catalog.price}".text.bold.xl4.red800.make().pOnly(left: 20),
          ElevatedButton(onPressed: () {}, 
            style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())
            ),
            child: "Add to cart".text.xl.make()).pOnly(right: 20).wh(140,50)
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl.color(context.accentColor).bold.make().pOnly(top: 16),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make().py8(),
                      "Eos eos et invidunt duo et et sed magna, at et takimata est diam. Est gubergren et sed sed. Ut magna gubergren et at ipsum dolore amet diam. Clita eos gubergren consetetur dolore eirmod vero diam vero dolor, diam eirmod gubergren accusam justo takimata no no, diam lorem voluptua clita."
                      .text.textStyle(context.captionStyle).lg.make().p16().pOnly(top: 20),
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