import 'dart:convert';

class Reciters {
  String? title;
  String? name;
  String? desc;
  String? sourate;
  String? aya;
  Reciters({
    this.title,
    this.name,
    this.desc,
    this.sourate,
    this.aya,
  });

  


 factory Reciters.fromMap(Map<String, dynamic> map) {
    
      return Reciters(
     title: map['title'],
     name: map['name'],
      desc: map['desc'],
      sourate: map['sourate'],
      aya: map['aya'],
      );
  
  }

  

  static Reciters? fromJson(String source) => Reciters.fromMap(json.decode(source));
}
