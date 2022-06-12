// ignore_for_file: prefer_const_constructors



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infos_app/detail.dart';
import '../models/articles.dart';
import 'package:cached_network_image/cached_network_image.dart';


Widget Mobile(BuildContext context, Articles articles) {
  return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Detail(articles)));
      },
     child:  Container(
          
        margin: EdgeInsets.all(12.0),
        padding: EdgeInsets.all(8.0),

        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(blurRadius: 3.0, color: Colors.grey.shade300)
            ]),

          
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
         
          
            children: [

          
              Container(
                  padding: EdgeInsets.all(6.0),
                  height:250,
                 
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                     image: DecorationImage(image:NetworkImage(articles.url!),fit: BoxFit.cover)

                      )),
              SizedBox(
                height: 8.0,
              ),
              Container(
                margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(articles.source!.name!,
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 8.0,
              ),
              Text(articles.title!,
                  overflow: TextOverflow.ellipsis,
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 8.0,
              ),
              Text(articles.publishedAt ?? "no date ",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ]),
      ));
}

