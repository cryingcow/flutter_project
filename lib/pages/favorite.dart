import 'package:flutter/material.dart';
import 'package:flutter_application/model/favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MyFavoritePage extends StatelessWidget {
  const MyFavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final productmodels = provider.favorites;
    return Scaffold(
      body: ListView.builder(
          itemCount: productmodels.length,
          itemBuilder: (context, index) {
            final productmodel = productmodels[index];
            return Flexible(
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        productmodel.url ?? '',
                        height: 80,
                        width: 80,
                        errorBuilder: (context, error, StackTrace) =>
                            Icon(Icons.image),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productmodel.name ?? '',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              NumberFormat('###,###,###')
                                      .format(productmodel.price) +
                                  "VNĐ",
                              style: TextStyle(fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(productmodel.description ?? '',
                                style: TextStyle(fontSize: 15),
                                overflow: TextOverflow.ellipsis)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: IconButton(
                          onPressed: () {
                            provider.toggleFavorite(productmodel);
                          },
                          icon: provider.isExist(productmodel)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              : const Icon(Icons.favorite_border_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
