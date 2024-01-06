// ignore_for_file: prefer_interpolation_to_compose_strings

class Product {
  int? id;
  String? name;
  dynamic? picture;
  String? description;
  double? price;
  double? weight;
  int? quantity;
  int? stock;

  Product({
    this.id,
    this.name,
    this.picture,
    this.description,
    this.price,
    this.weight,
    this.quantity,
    this.stock,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    picture = json["picture"] != null
        ? json["picture"].toString().contains("https") == false
            ? "http://mevdnic.cluster031.hosting.ovh.net/protech/public/storage/" +
                json["picture"]
            : json["picture"]
        : "https://upload.wikimedia.org/wikipedia/commons/1/14/Product_sample_icon_picture.png";
    description = json["description"];
    price = double.parse(json["price"]);
    weight = double.parse(json["weight"]);
    quantity = 1;
    stock = json["stock"];
  }

  Product copyWith({
    int? id,
    String? name,
    dynamic? picture,
    String? description,
    double? price,
    double? weight,
    int? quantity,
    int? stock,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      picture: picture ?? this.picture,
      description: description ?? this.description,
      price: price ?? this.price,
      weight: weight ?? this.weight,
      quantity: quantity ?? this.quantity,
      stock: stock ?? this.stock,
    );
  }
}
