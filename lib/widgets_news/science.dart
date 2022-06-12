// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:infos_app/models/articles.dart';
import 'package:infos_app/models/monde.dart';
import 'package:infos_app/repository/repository.dart';
import 'package:infos_app/screens/desktop.dart';
import 'package:infos_app/screens/mobile.dart';

class Eco extends StatefulWidget {
  const Eco({Key? key}) : super(key: key);

  @override
  State<Eco> createState() => _Eco();
}

class _Eco extends State<Eco> {
  late Future<List<allSource>> list;

  Reposi reposi = Reposi();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getall();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: reposi.getScience(),
        builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
          if (snapshot.hasData) {
            List<Articles> li = snapshot.data!;
            return ListView.builder(
                itemCount: li.length,
                itemBuilder: (context, index) {
                  return Responsive(context, li[index]);
                });
          }

          return Center(
            //child: Text("${snapshot.hasError}"),
            child: CircularProgressIndicator(),
          );
        });
  }
}


Widget Responsive(BuildContext context, Articles articles) {
  return LayoutBuilder(builder: (context, constraints) {
    if (constraints.minWidth<80 && constraints.maxWidth <600) {

      return Mobile(context, articles);
      
    } else {
     return Desktop(context, articles);
    }
  });
}