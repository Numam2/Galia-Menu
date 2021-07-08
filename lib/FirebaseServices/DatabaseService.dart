import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:galia_menu/Models/Products.dart';

class DatabaseService {
  //Collection reference products
  final CollectionReference<Map<String, dynamic>> menu = FirebaseFirestore
      .instance
      .collection('Products')
      .doc('VTam7iYZhiWiAFs3IVRBaLB5s3m2')
      .collection('Menu');

  // Product List from snapshot
  List<Products> _productListFromSnapshot(
      QuerySnapshot<Map<String, dynamic>> snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Products(
          doc.data()['Product'] ?? '',
          doc.data()['Price'] ?? 0,
          doc.data()['Image'] ?? '',
          doc.data()['Description'] ?? '',
          doc.data()['Category'] ?? '',
          doc.data()['Available'] ?? true,
          doc.data()['Time'] ?? 0,
          doc.data()['Vegan'] ?? false,
          (doc.data()['Price Options'] == null)
              ? []
              : doc.data()['Price Options'].map<PriceOptions>((item) {
                  return PriceOptions(
                    item['Option'] ?? '',
                    item['Price'] ?? 0,
                  );
                }).toList(),
        );
      }).toList();
    } catch (e) {
      print(e);
      return snapshot.docs.map((doc) {
        return Products('', 0, '', '', '', false, 0, false, []);
      }).toList();
    }
  }

  // Personal Challenges Stream
  Stream<List<Products>> productList(String category) async* {
    yield* menu
        .where('Category', isEqualTo: category)
        .snapshots()
        .map(_productListFromSnapshot);
  }
}
