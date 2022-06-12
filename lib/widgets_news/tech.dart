// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:infos_app/models/articles.dart';
import 'package:infos_app/models/monde.dart';
import 'package:infos_app/repository/repository.dart';
import 'package:infos_app/screens/mobile.dart';

import '../screens/desktop.dart';

class Tech extends StatefulWidget {
  const Tech({Key? key}) : super(key: key);

  @override
  State<Tech> createState() => _Tech();
}

class _Tech extends State<Tech> {
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
        future: reposi.getTech(),
        builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
          if (snapshot.hasData) {
            List<Articles> li = snapshot.data!;
            return ListView.builder(
                itemCount: li.length,
                itemBuilder: (context, index) {
                  return Mobile(context, li[index]);
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
    if (constraints.minWidth <80 && constraints.maxWidth <400) {

      return Mobile(context, articles);
      
    } else {
     return Desktop(context, articles);
    }
  });
}