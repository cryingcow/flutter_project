import 'package:flutter/material.dart';
import 'package:flutter_application/model/product_viewmodel.dart';
import 'package:flutter_application/model/products_model.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsVM>(
      builder: (context, value, child) => Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: value.lst.length,
                      itemBuilder: ((context, index) {
                        return itemListView(value.lst[index], index);
                      })))
            ]),
          ),
        ),
      ),
    );
  }
}

Widget itemListView(ProductModel productModel, index) {
  return Flexible(
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(color: Colors.grey.shade100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              productModel.url ?? '',
              height: 80,
              width: 80,
              errorBuilder: (context, error, StackTrace) => Icon(Icons.image),
            ),
            SizedBox(
              width: 30,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name ?? '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    NumberFormat('###,###,###').format(productModel.price) +
                        "VNĐ",
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(productModel.description ?? '',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
            Consumer<ProductsVM>(
                builder: (context, value, child) => InkWell(
                      onTap: () {
                        value.del(index);
                      },
                      child: SizedBox(
                        width: 50,
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ))
          ],
        ),
      ),
    ),
  );
}
