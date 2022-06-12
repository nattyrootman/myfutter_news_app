// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infos_app/models/articles.dart';
import 'package:infos_app/repository/repository.dart';
import 'package:infos_app/screens/mobile.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../screens/desktop.dart';

class Sports extends StatefulWidget {
 const Sports({Key? key}) : super(key: key);

  @override
  State<Sports> createState() => _Sports();
}

class _Sports extends State<Sports> {
  //Completer<WebViewController> completer = Completer<WebViewController>();

  Reposi reposi = Reposi();


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
    
    FutureBuilder(
      future: reposi.fetchSport(),
      builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
       
        if (snapshot.hasData) {

           List<Articles> list = snapshot.data!;

          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Mobile(context, list[index]);
              });
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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