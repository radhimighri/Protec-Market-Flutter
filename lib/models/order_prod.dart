class OrderProduct {
  int? id;
  String? name;
  String? picture;
  String? description;
  String? price;
  String? weight;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  Pivot? pivot;

  OrderProduct(
      {id,
      this.name,
      this.picture,
      this.description,
      this.price,
      this.weight,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot});

  OrderProduct.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    picture = json["picture"] ??
        "https://upload.wikimedia.org/wikipedia/commons/1/14/Product_sample_icon_picture.png";
    description = json["description"];
    price = json["price"];
    weight = json["weight"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    deletedAt = json["deleted_at"];
    pivot = json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["picture"] = picture;
    data["description"] = description;
    data["price"] = price;
    data["weight"] = weight;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["deleted_at"] = deletedAt;
    if (pivot != null) data["pivot"] = pivot?.toJson();
    return data;
  }
}

class Pivot {
  int? orderId;
  int? productId;
  int? quantity;

  Pivot({orderId, productId, quantity});

  Pivot.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    productId = json["product_id"];
    quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["order_id"] = orderId;
    data["product_id"] = productId;
    data["quantity"] = quantity;
    return data;
  }
}
