import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/model/products_model.dart';
import 'dart:developer';

class ReadData {
  /* String baseApiProducts =
      'http://sneakerhead-production.up.railway.app/products?pageNo=1&pageSize=10';
  Future<List<ProductModel>> loadData() async {
    var data = await rootBundle.loadString("assets/files/listproduct.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }*/

  /*Future<List<products>> fetchProducts() async {
    var data = await Dio().get(baseApiProducts);
    var dataJson = jsonDecode(data.data.toString());
    log(dataJson);
    return (dataJson as List).map((e) => products.fromJson(e)).toList();
  }*/
}
