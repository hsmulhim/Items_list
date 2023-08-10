import 'package:cards_app/models/items_model.dart';
import 'package:cards_app/screens/wish_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Products product;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: Text(widget.product.title!),
        ),
      body: Column(
        
        children: [
        Expanded(
          flex:1,
          child: Container(
              child: Image.network(
                        widget.product.thumbnail!,
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                       fit: BoxFit.fill,
                      ),
        )),
        Expanded(
          flex: 2,
          child: Container( 
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
            ),
             width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Text(widget.product.title!,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
               Text("${widget.product.price!} \$",style: TextStyle(fontSize: 15,color: Colors.red),),

               Row(
               // mainAxisAlignment: ,
                children: [
                Container(
                decoration:BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10)
                  
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(10),
                child: Text(widget.product.brand!,textAlign: TextAlign.center,style: TextStyle(fontSize: 17,color: Colors.black),),
                padding: EdgeInsets.all(8),
               ),
               Container(
                decoration:BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10)
                  
                ),
                clipBehavior: Clip.antiAlias,
               margin: EdgeInsets.all(10),
                child: Text(widget.product.category!,textAlign: TextAlign.center,style: TextStyle(fontSize: 17,color: Colors.black),),
                padding: EdgeInsets.all(8),
               ),
               ],),

               Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
               Text(widget.product.description!,style: TextStyle(fontSize: 15,color: Colors.black),),

               ElevatedButton(
                onPressed: (){
                  WishList!.add(widget.product);
                  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WishListScreen(
                product:widget.product,
                
                  )));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red
                ),
                 child: Text("add to my Wish List"),)
          ],)
          ,))
        
      ],),
    );
  }
}