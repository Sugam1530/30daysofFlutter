// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_first_app/models/catalog.dart';
import 'package:flutter_first_app/widgets/drawer.dart';
import 'package:flutter_first_app/widgets/themes.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


    loadData() async {
     await Future.delayed(Duration(seconds: 2)); 
     final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
     final decodedData = jsonDecode(catalogJson);
     var productsData = decodedData["products"];
     CatalogModel.items = List.from(productsData)
                          .map<Item>((item) => Item.fromMap(item))
                          .toList();
      setState(() {});                    
    }

    void initState() {
      super.initState();
      loadData();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App",
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
        ),
      ),
      body:SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text("Trending Items",style: TextStyle(
                fontSize: 20
                ),
              ),
               if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList(),)
               else
                Center(child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ).backgroundColor(MyTheme.creamColor),  
      drawer: MyDrawer(),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index){
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog:catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog}) : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatalogImage(image: catalog.image),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.xl.color(MyTheme.darkBluishColor).bold.make().pOnly(top: 16),
              catalog.desc.text.textStyle(context.captionStyle).make().py8(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: () {}, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(StadiumBorder())
                  ),
                  child: "Buy".text.make())
                ],
              )
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Image.network(image).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}
