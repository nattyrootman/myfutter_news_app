// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infos_app/mali_sugu/sugu_accueil.dart';
import 'package:infos_app/repository/repository.dart';
import 'package:infos_app/screens/navigation.dart';

import 'package:infos_app/widgets_news/business.dart';
import 'package:infos_app/widgets_news/science.dart';
import 'package:infos_app/widgets_news/nouvelle.dart';
import 'package:infos_app/widgets_news/sport.dart';
import 'package:infos_app/widgets_news/tech.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
         colorScheme: ColorScheme.light(),
        ),
        
        home: const DefaultTabController(
          length: 5,
          child: MyHomePage(title: 'App Infos'),
        ));
  }

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool test = false;

 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   
    setState(() {
      test = test;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final list = [
      "Nouvelles",
      "Business",
      "Science",
      "Tech",
      "Sport",
    ];

    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 100.0,
        title: Text('Info App',
            style: TextStyle(
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.blue,
            indicatorWeight: 5.0,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              for (final tb in list)
                Tab(
                  text: tb,
                )
            ]),
       
      ),

      body: TabBarView(children: [
        Tab(child: Nouvelle()),
        //http:/​/​y2u.​be/​SmTCmDMi4BY.
        Tab(child: Business()),
        Tab(child: Eco()),
        Tab(child: Tech()),
        Tab(child: Sports()),
      ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Acueil()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
