class Products {
  String? productId;
  String? categoryId;
  String? name;
  int? price;
  int? quantity;
  int? availableQuantity;
  String? description;
  String? url;
  List<Object>? sizes;
  Products(
      this.productId,
      this.categoryId,
      this.name,
      this.price,
      this.quantity,
      this.availableQuantity,
      this.description,
      this.url,
      this.sizes);
  factory Products.fromMap(Map<String, dynamic> json) {
    return Products(
      json['productId'],
      json['categoryId'],
      json['name'],
      json['price'],
      json['quantity'],
      json['availableQuantity'],
      json['description'],
      json['url'],
      json['sizes'],
    );
  }
  factory Products.fromJson(Map<String, dynamic> data) {
    return Products(
      data['productId'],
      data['categoryId'],
      data['name'],
      data['price'],
      data['quantity'],
      data['availableQuantity'],
      data['description'],
      data['url'],
      data['sizes'],
    );
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
