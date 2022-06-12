// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:infos_app/models/articles.dart';
import 'package:infos_app/models/monde.dart';
import 'package:infos_app/repository/repository.dart';

import '../screens/desktop.dart';
import '../screens/mobile.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  State<Business> createState() => _Business();
}

class _Business extends State<Business> {
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
        future: reposi.getBusiness(),
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