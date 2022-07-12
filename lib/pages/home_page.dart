// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_app/core/store.dart';
import 'package:flutter_first_app/models/cart.dart';
import 'package:flutter_first_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_first_app/models/catalog.dart';
import 'package:flutter_first_app/widgets/drawer.dart';
import 'package:flutter_first_app/widgets/themes.dart';

import '../widgets/home_widgets/catalog_list.dart';
import '../widgets/item_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";


    loadData() async {
     await Future.delayed(const Duration(seconds: 2)); 
     final catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder:(ctx, _) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        child: Icon(CupertinoIcons.cart, color: Colors.white,),
        backgroundColor: context.theme.buttonColor,
        ).badge(color: Vx.red500,size: 22, count: _cart.items.length, textStyle: 
        TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
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
              "Trending Products".text.xl2.make(),
               if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                Expanded(child: CatalogList().py8(),)
               else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),  
      drawer: MyDrawer(),
    );
  }
}
