// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';

Widget Nave(BuildContext context) {
  return Drawer(


    child: ListView(children: [


   DrawerHeader(
     child: Container(decoration: BoxDecoration(

       borderRadius: BorderRadius.circular(16),
       color: Colors.grey.shade300,

   image: DecorationImage(image:NetworkImage("https://www.bing.com/th/id/OIP.C2G6QCvAC_FCKS6w6qz9dQHaD8?w=285&h=180&c=7&r=0&o=5&pid=1.7")),

   ),),),
   
   Divider(height: 1,thickness: 1,),

   ListTile(
     title: Text("abathily@gmail.com"),

   ),

   
   ListTile(
     title: Text("Email"),
     leading: Icon(Icons.email),

   ),
   
   ListTile(
     title: Text("Facebook"),
     leading: Icon(Icons.facebook)


   ),
   
   ListTile(
     title: Text("About me"),
     leading: Icon(Icons.more),

   )



    ]),





  );
}
