// ignore_for_file: prefer_interpolation_to_compose_strings

class Category {
  int? id;
  String? name;
  String? logo;

  Category({required this.id, required this.name, required this.logo});

  Category.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    logo =
        "http://mevdnic.cluster031.hosting.ovh.net/protech/storage/app/public/" +
            json["logo"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["logo"] = this.logo;
    return data;
  }
}
