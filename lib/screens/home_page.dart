import 'package:cards_app/componets/card_widget.dart';
import 'package:cards_app/main.dart';
import 'package:cards_app/screens/wish_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade300,
          title: Text('Products'),
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WishListScreen()));
              },
              icon: Icon(Icons.favorite_outline)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        body: SafeArea(
          child: ListView.builder(
            itemBuilder: (context, int index) {
              return CardWidget(product: ProductList![index]);
            },
            itemCount: ProductList!.length,
          ),
        ));
  }
}
