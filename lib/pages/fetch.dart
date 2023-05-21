import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

Future<List<Album>> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'http://sneakerhead-production.up.railway.app/products?pageNo=1&pageSize=10'));

  if (response.statusCode == 200) {
    final List result = json.decode(response.body);
    return result.map((e) => Album.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

class Album {
  String? productId;
  String? categoryId;
  String? name;
  int? price;
  int? quantity;
  int? availableQuantity;
  String? description;
  String? url;

  Album({
    required this.productId,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.availableQuantity,
    required this.description,
    required this.url,
  });

  Album.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    categoryId = json['categoryId'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    availableQuantity = json['availableQuantity'];
    description = json['description'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['availableQuantity'] = availableQuantity;
    data['description'] = description;
    data['url'] = url;
    //data['sizes'] = sizes;
    return data;
  }
}

void main() => runApp(const Fetch());

class Fetch extends StatefulWidget {
  const Fetch({super.key});

  @override
  State<Fetch> createState() => _FetchState();
}

class _FetchState extends State<Fetch> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Image.network(snapshot.data![index].url.toString()),
                  ),
                  title: Text(snapshot.data![index].name ?? ''),
                  subtitle: Text(snapshot.data![index].quantity.toString()),
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
