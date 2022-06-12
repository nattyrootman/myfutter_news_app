// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:infos_app/mali_sugu/sugu_model.dart';

class Acueil extends StatefulWidget {
  const Acueil({Key? key}) : super(key: key);

  @override
  State<Acueil> createState() => _Acueil();
}

class _Acueil extends State<Acueil> {
  List<SuguProduit> list = [];

  void call() {
    list = SuguProduit.list();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Mali Sugu"),
        elevation: 50.0,
        centerTitle: true,
      ),
      body: Container(

   decoration:  BoxDecoration(

     borderRadius: BorderRadius.circular(16),
     color: Colors.grey.shade300,
   ),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        
        child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: GridView.builder(
            itemCount: list.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return 
              Produit(
                  context,
                  list[index],
              
              );
            }),
      ),
      
       ),
      
    
    );
  }
}

Widget Produit(BuildContext context, SuguProduit produit) {
  return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Acueil()));
      },
     
        child:Card(
          elevation: 10,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
        
         children: [
           SizedBox(height: 10,),
          Text(produit.name!,style: TextStyle(fontSize: 16,color: Colors.black),),
         
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Price:"),
                 SizedBox(width: 8,),
                 Text("${produit.price!}")]),
            SizedBox(height: 10,),
         
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Poids:"), 
              SizedBox(width: 8,),
              Text("${produit.poid!}")])
          
        ]),)
      
      );
}
