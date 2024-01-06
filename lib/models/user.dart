class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? phoneNumber;

  User(
      {this.id, this.name, this.email, this.emailVerifiedAt, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    phoneNumber = json["phone_number"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["email_verified_at"] = emailVerifiedAt;
    data["phone_number"] = phoneNumber;
    return data;
  }
}
