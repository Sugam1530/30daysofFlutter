import 'package:flutter_first_app/core/store.dart';
import 'package:flutter_first_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel{
  
  //catalog field
  late CatalogModel _catalog;
  
  //store Ids of every product
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get Catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get Items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get Total Price
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }


  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}

