import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_first_app/models/catalog.dart';
import 'package:flutter_first_app/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
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
          padding: const EdgeInsets.all(20.0),
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
      ),  
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
          Image.network(catalog.image),
        ],
      ),
    ).white.rounded.square(100).make().py16();
  }
}
