import 'dart:convert';

import 'package:infos_app/models/source.dart';

import 'package:intl/intl.dart';

class Articles {
  String key = "06eaa91812b94becbf353d4d16ee3753";

  Source? source;

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  DateFormat format = DateFormat("dd//MMM/yyyy");
  String d = DateFormat("dd//MMM/yyyy").format(DateTime.now());

  factory Articles.fromJson(Map<String, dynamic> map) {
    return Articles(
        source: Source.fromJson((map["source"])),
        author: (map["author"]!=null)?map["author"].toString():"",
        title: map["title"] as String,
        description: map["description"] as String,
        url: map["url"] as String,
        urlToImage:
            (map["urlToImage"] != null) ? map["urlToImage"].toString() : "Image no available",
        publishedAt: DateFormat("dd/MMM/yyyy/hh:mm")
            .format(DateTime.parse(map["publishedAt"])),
        content: map["content"] as String);

    // map["publishedAt"] as String,
  }

}
