import 'package:flutter/material.dart';
import 'package:flutter_application/layouts/tabbar.dart';
import 'package:flutter_application/layouts/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyTabBar(),
    );
  }
}
