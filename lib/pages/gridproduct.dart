import 'package:flutter/material.dart';
import 'package:flutter_application/model/favorite_provider.dart';
import 'package:flutter_application/model/products_model.dart';
import 'package:flutter_application/pages/detail.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GridProduct extends StatelessWidget {
  final Future<List<ProductModel>> data;
  const GridProduct({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: data,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(title: const Text('Home')),
              body: Container(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        slide(snapshot.data!),
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
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return itemGridView(
                                      snapshot.data![index], context);
                                }))
                      ]),
                ),
              ),
            );
          }
          ;
          return Scaffold(
              appBar: AppBar(title: const Text('Home')),
              body: Center(child: CircularProgressIndicator()));
        });
  }

  Widget slide(List<ProductModel> listProduct) {
    return Container(
      child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: listProduct
              .map((item) => Container(
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(item.url ?? '',
                                  fit: BoxFit.cover, width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Text(
                                    item.name!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ))
              .toList()),
    );
  }

  Widget itemGridView(ProductModel productModel, BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    ProductDetail(productModel: productModel))));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        child: Container(
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
                  child: Image.network(
                    productModel.url!,
                    height: 100,
                    width: 100,
                    errorBuilder: (context, error, StackTrace) =>
                        Icon(Icons.image),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: IconButton(
                    onPressed: () {
                      provider.toggleFavorite(productModel);
                    },
                    icon: provider.isExist(productModel)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border_outlined),
                  ),
                )
              ]),
              Text(
                productModel.name ?? '',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                NumberFormat('###,###,###').format(productModel.price) + 'VNĐ',
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
