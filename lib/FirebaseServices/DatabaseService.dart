

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galia_website/Models/Products.dart';

class DatabaseService {

  //Collection reference products
  final CollectionReference menu = FirebaseFirestore.instance.collection('Products').doc('VTam7iYZhiWiAFs3IVRBaLB5s3m2').collection('Menu');

  // Product List from snapshot
  List<Products> _productListFromSnapshot (QuerySnapshot snapshot){

    try{
      return snapshot.docs.map((doc){
        return Products(
          product: doc.data()['Product'] ?? '',
          price: doc.data()['Price'] ?? 0,        
          category: doc.data()['Category'] ?? 0,
          image: doc.data()['Image'] ?? '',
          description: doc.data()['Description'] ?? '',
          options: doc.data()['Options'] ?? [],
          available: doc.data()['Available'] ?? false,
          milkOptions: doc.data()['MilkOptions'] ?? false,
          );
        }
      ).toList();
    } catch(e){
      print(e);
      return null;   
    }
  }

  // Personal Challenges Stream
  Stream <List<Products>> productList (String category) async*{
    yield* menu.where('Category', isEqualTo: category).snapshots().map(_productListFromSnapshot);
  }

}