import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/data/data.dart';
import 'package:flutter_application/model/product_model.dart';
import 'package:intl/intl.dart';

class GridProduct extends StatefulWidget {
  const GridProduct({super.key});

  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  List<ProductModel> listProduct = [];
  Future<String> loadList() async {
    listProduct = await ReadData().loadData();
    return '';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadList(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "HOME",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins'),
                    ),
                    Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15),
                            itemCount: listProduct.length,
                            itemBuilder: (context, index) {
                              return itemGridView(listProduct[index]);
                            }))
                  ]),
            ),
          );
        });
  }

  Widget itemGridView(ProductModel productModel) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Image.asset(
                'assets/images/' + productModel.image!,
                height: 100,
                width: 100,
                errorBuilder: (context, error, StackTrace) => Icon(Icons.image),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border_outlined)),
            )
          ]),
          Text(
            productModel.name ?? '',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            NumberFormat('###,###,###').format(productModel.price),
            style: TextStyle(fontSize: 15),
          ),
          Text(
            productModel.des!,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
