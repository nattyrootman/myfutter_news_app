// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

class SuguProduit {
  final String? name;
  final String? price;
  final double? poid;

 static _produt() {}
  static SuguProduit produit = SuguProduit._produt();
 

  SuguProduit(this.name, this.price, this.poid);

static  List<SuguProduit> list() {
    List<SuguProduit> list = [
      SuguProduit("Mangue", "200f", 1.5),
      SuguProduit("Orange", "100f", 2.0),
      SuguProduit("Avocat", "300f", 1.0),





      
      SuguProduit("Namassa", "150f", 1.2),
      SuguProduit("Limburu", "75f", 0.5),
      SuguProduit("Ntomi", "50f", 0.40),
      SuguProduit("Papaye", "400f", 3.5),
      SuguProduit("Tamaro", "500f", 1.5),
      SuguProduit("Mangoro", "600f", 2.5),
      SuguProduit("Banana", "700f", 3.5),
    ];

    return list;
  }
}
