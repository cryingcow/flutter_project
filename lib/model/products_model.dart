class ProductModel {
  String? productId;
  String? categoryId;
  String? name;
  int? price;
  int? quantity;
  int? availableQuantity;
  String? description;
  String? url;
  List<dynamic>? sizes;

  ProductModel(
      {required this.productId,
      required this.categoryId,
      required this.name,
      required this.price,
      required this.quantity,
      required this.availableQuantity,
      required this.description,
      required this.url,
      required this.sizes});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    categoryId = json['categoryId'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    availableQuantity = json['availableQuantity'];
    description = json['description'];
    url = json['url'];
    sizes = json['sizes'];
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
    data['sizes'] = sizes;
    return data;
  }
}
