class Order {
  int? id;
  int? customerId;
  String? totalPrice;
  String? stauts;
  String? number;
  String? paymentMethod;
  String? paymentStatus;
  String? createdAt;
  String? pickDate;

  Order({
    this.id,
    this.customerId,
    this.totalPrice,
    this.stauts,
    this.number,
    this.paymentMethod,
    this.paymentStatus,
    this.createdAt,
    this.pickDate,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    customerId = json["customer_id"];
    totalPrice = json["total_price"];
    stauts = json["stauts"];
    number = json["number"];
    paymentMethod = json["payment_method"];
    paymentStatus = json["payment_status"];
    createdAt = json["created_at"].substring(0, 10);
    pickDate = json["pick_up_date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["customer_id"] = customerId;
    data["total_price"] = totalPrice;
    data["stauts"] = stauts;
    data["number"] = number;
    data["payment_method"] = paymentMethod;
    data["payment_status"] = paymentStatus;
    data["created_at"] = createdAt;
    return data;
  }
}
