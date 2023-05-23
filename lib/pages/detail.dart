import 'package:flutter/material.dart';
import 'package:flutter_application/model/product_viewmodel.dart';
import 'package:flutter_application/model/products_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

const List<String> list = <String>['Size 43', 'Size 42', 'Size 41'];

class _ProductDetailState extends State<ProductDetail> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SneakerHead'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  child: Image.network(widget.productModel.url!)),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.productModel.name ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.productModel.description ?? '',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                NumberFormat('###,###,###' + "VNĐ")
                    .format(widget.productModel.price),
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
                    items:
                        (widget.productModel.sizes?.map((e) => e.size).toList())
                            ?.map<DropdownMenuItem<String>>((dynamic value) {
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
              Consumer<ProductsVM>(
                builder: (context, value, child) => Material(
                  color: Colors.orange,
                  child: InkWell(
                    onTap: () {
                      value.add(widget.productModel);
                    },
                    child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text('ADD TO CART',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<ProductsVM>(
                builder: (context, value, child) => Material(
                  color: Colors.orange,
                  child: InkWell(
                    onTap: () {
                      //value.add(widget.productModel);
                    },
                    child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                            child: Text('PURCHASE',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
