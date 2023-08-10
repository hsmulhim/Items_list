import 'package:cards_app/componets/wish_list_card.dart';
import 'package:cards_app/models/items_model.dart';
import 'package:flutter/material.dart';

List<Products>? WishList = [];

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key, this.product});
  final Products? product;

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.red.shade400,
          title: Text('whish List'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: ListView.builder(
          itemBuilder: (context, int index) {
            return InkWell(
                onLongPress: () {
                  WishList!.remove(widget.product);
                  setState(() {});
                },
                child: WishListCard(product: WishList![index]));
          },
          itemCount: WishList!.length,
        ));
  }
}
