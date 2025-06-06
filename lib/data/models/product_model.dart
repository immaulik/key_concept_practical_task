class ProductModel {
  int id = 0;
  String name = "";
  int price = 0;
  String image = "";
  String category = "";

  ProductModel({
    this.id = 0,
    this.name = "",
    this.image = "",
    this.category = "",
    this.price = 0,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    price = json['price'] ?? 0;
    image = json['image'] ?? "";
    category = json['category'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['category'] = category;
    return data;
  }
}
