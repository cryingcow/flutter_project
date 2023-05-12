class ProductModel {
  String? id;
  String? name;
  int? price;
  String? image;
  String? des;
  ProductModel({this.id, this.name, this.price, this.image, this.des});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    des = json['des'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['des'] = des;
    return data;
  }
}
