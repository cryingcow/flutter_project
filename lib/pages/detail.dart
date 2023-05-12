import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

const List<String> list = <String>['Size 43', 'Size 42', 'Size 41'];

class _ProductDetailState extends State<ProductDetail> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/product1.png'),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'NIKE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'AIR JORDAN 1 RETRO HIGH OG ' '''OBSIDIAN''',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '13,000,000 VND',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              InputDecorator(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isDense: true,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    autofocus: false,
                    focusColor: Colors.white,
                    iconSize: 36,
                    value: dropdownValue,
                    hint: const Text('Choose your size'),
                    isExpanded: true,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('ADD TO CART',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'ADD TO WISHLIST',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
