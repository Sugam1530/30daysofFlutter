// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_first_app/models/catalog.dart';
import 'package:flutter_first_app/widgets/drawer.dart';
import 'package:flutter_first_app/widgets/themes.dart';

import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


    loadData() async {
     await Future.delayed(const Duration(seconds: 2)); 
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
        title: const Text("Catalog App",
        style: TextStyle(color: Colors.black),
        textAlign: TextAlign.center,
        ),
      ),
      body:SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text("Trending Items",style: TextStyle(
                fontSize: 25
                ),
              ),
               if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList().py8(),)
               else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ).backgroundColor(MyTheme.creamColor),  
      drawer: MyDrawer(),
    );
  }
}
