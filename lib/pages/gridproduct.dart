import 'package:flutter/material.dart';
import 'package:flutter_application/model/favorite_provider.dart';
import 'package:flutter_application/model/products_model.dart';
import 'package:flutter_application/pages/detail.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GridProduct extends StatelessWidget {
  final Future<List<ProductModel>> data;
  const GridProduct({super.key, required this.data});

/*  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  List<ProductModel> listProduct = [];
  late Future<List<ProductModel>> data;
  Future<String> loadList() async {
    listProduct = await ReadData().loadData();
    return '';
  }

  @override
  void initState() {
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: data,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
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
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return itemGridView(
                                    snapshot.data![index], context);
                              }))
                    ]),
              ),
            );
          }
          ;
          return const CircularProgressIndicator();
        });
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
