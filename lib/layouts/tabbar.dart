import 'package:flutter/material.dart';
import 'package:flutter_application/pages/detail.dart';
import 'package:flutter_application/pages/fetch.dart';
import 'package:flutter_application/pages/gridproduct.dart';
import 'package:flutter_application/pages/authpage.dart';
import 'package:flutter_application/layouts/drawer.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('SneakerHead'),
          ),
          drawer: const SideDrawer(),
          bottomNavigationBar: const TabBar(
            labelColor: Color.fromRGBO(255, 137, 6, 1),
            unselectedLabelColor: Color.fromRGBO(38, 50, 56, 1),
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide:
                  BorderSide(color: Color.fromRGBO(255, 137, 6, 1), width: 3.0),
              insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
            ),
            tabs: [
              Tab(icon: Icon(Icons.home_outlined)),
              Tab(icon: Icon(Icons.favorite_border_sharp)),
              Tab(icon: Icon(Icons.shopping_bag_outlined)),
              Tab(icon: Icon(Icons.perm_contact_cal_outlined)),
            ],
          ),
          body: const TabBarView(
            children: [
              GridProduct(),
              Fetch(),
              ProductDetail(),
              Auth(),
            ],
          ),
        ),
      ),
    );
  }
}
