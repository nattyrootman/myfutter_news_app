import 'dart:convert';

class Source {
  String? id;
  String? name;
  Source({
    this.id,
    this.name,
  });



  factory Source.fromJson(Map<String, dynamic> map) {
    return Source(
        id: (map["id"] != null) ? map["id"].toString() : "",
        name: (map["name"] != null) ? map["name"].toString() : "");
  }
}
