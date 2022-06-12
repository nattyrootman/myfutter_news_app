// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infos_app/detail.dart';
import 'package:infos_app/models/articles.dart';
import 'package:infos_app/repository/repository.dart';
import 'package:infos_app/screens/desktop.dart';
import 'package:infos_app/screens/mobile.dart';
import 'package:intl/intl.dart';

class Nouvelle extends StatefulWidget {
  const Nouvelle({Key? key}) : super(key: key);

  @override
  State<Nouvelle> createState() => _NouvelleState();
}

class _NouvelleState extends State<Nouvelle> {
  List<Articles> list = [];

  Reposi reposi = Reposi();

  getall() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screean = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: reposi.fetchData(),
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
            // child: Text("${snapshot.hasError}"),
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






