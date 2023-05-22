import 'package:flutter/material.dart';
import 'package:flutter_application/model/product_viewmodel.dart';
import 'package:flutter_application/model/products_model.dart';
import 'package:flutter_application/pages/cart.dart';
import 'package:flutter_application/pages/detail.dart';
import 'package:flutter_application/pages/gridproduct.dart';
import 'package:flutter_application/pages/authpage.dart';
import 'package:flutter_application/layouts/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application/model/products_model.dart';
import 'package:provider/provider.dart';

Future<List<ProductModel>> fetchProductModel() async {
  final response = await http.get(Uri.parse(
      'http://sneakerhead-production.up.railway.app/products?pageNo=1&pageSize=10'));

  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    print(result);
    return result.map((e) => ProductModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

class MyTabBar extends StatefulWidget {
  const MyTabBar({super.key});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  Future<List<ProductModel>> futureProduct = fetchProductModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProductsVM())],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('SneakerHead'),
            ),
            drawer: const SideDrawer(),
            bottomNavigationBar: const TabBar(
              labelColor: Color.fromRGBO(255, 137, 6, 1),
              unselectedLabelColor: Color.fromRGBO(38, 50, 56, 1),
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                    color: Color.fromRGBO(255, 137, 6, 1), width: 3.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
              tabs: [
                Tab(icon: Icon(Icons.home_outlined)),
                Tab(icon: Icon(Icons.favorite_border_sharp)),
                Tab(icon: Icon(Icons.shopping_bag_outlined)),
                Tab(icon: Icon(Icons.perm_contact_cal_outlined)),
              ],
            ),
            body: TabBarView(
              children: [
                GridProduct(data: futureProduct),
                const Auth(),
                const MyCart(),
                const Auth(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
