// ignore_for_file: prefer_const_declarations

import 'dart:convert';

//import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:infos_app/models/articles.dart';
import 'package:infos_app/models/monde.dart';

class Reposi {
  //String key = "06eaa91812b94becbf353d4d16ee3753";

  final String key ="d464793d4eec46668278a063f56ddb22";
 static final int page = 10;
  Future<List<Articles>> fetchData() async {
    String url ="https://newsapi.org/v2/top-headlines?category=general&apiKey=${key}&language=fr&pageSize=10";

    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(res.body);

      print(json.values);

      List<dynamic> body = json["articles"];
      List<Articles> list =
          body.map((dynamic e) => Articles.fromJson(e)).toList();
      print(list.length);

      return list;
    } else {
      throw (" an error might be occured");
    }
  }

  Future<List<Articles>> getBusiness() async {
    final int page=20;
    String url ="https://newsapi.org/v2/top-headlines?category=business&apiKey=${key}&language=fr&pageSize=page";

    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      print(json.values);

      List<dynamic> body = json["articles"];

      List<Articles> list = body.map((e) => Articles.fromJson(e)).toList();

      return list;
    } else {
      throw (" an error might be occured");
    }
  }

  Future<List<Articles>> getScience() async {
    // final int page=10;
   
       String url ="https://newsapi.org/v2/top-headlines?category=science&apiKey=${key}language=fr&pageSize=${page}";

    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      print(json.values);

      List<dynamic> body = json["sources"];

      List<Articles> list =
          body.map((dynamic e) => Articles.fromJson(e)).toList();

      return list;
    } else {
      throw (" an error might be occured");
    }
  }



  

  Future<List<Articles>> getTech() async {
    final  int page=10;
    final url = "https://newsapi.org/v2/top-headlines?category=technology&apiKey=${key}&language=fr&pageSize=${page}";

    final http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json["articles"];

      List<Articles> list =
          body.map((dynamic e) => Articles.fromJson(e)).toList();

      return list;
    } else {
      throw ("something went wrong");
    }
  }


  
  Future<List<Articles>> fetchSport() async {
    // final int page=10;

     String url ="https://newsapi.org/v2/top-headlines?category=sports&apiKey=${key}&language=fr&pageSize=${page}";

       
    final http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json["articles"];

      List<Articles> list =
          body.map((dynamic e) => Articles.fromJson(e)).toList();

      return list;
    } else {
      throw ("something went wrong");
    }
  }

}




