import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_app/core/store.dart';
import 'package:flutter_first_app/models/cart.dart';
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

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
    
  }
}

class _CartTotal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: ((context, _) {
            return "\$${_cart.totalPrice}".text.xl3.color(context.theme.accentColor).make();
            }),
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Buying not supported yes".text.make(),));
            }, 
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
    );
    
  }
}


class _CartList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty? "Please add some items".text.xl3.makeCentered(): ListView.builder(
      itemCount: _cart.items.length, 
      itemBuilder: (context, index)=> ListTile(
      leading: Icon(Icons.done),
      trailing: IconButton(
        icon: Icon(Icons.remove_circle_outline),
        onPressed: () {
          RemoveMutation(_cart.items[index]);
        },
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}