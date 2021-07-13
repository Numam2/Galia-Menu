import 'package:flutter/material.dart';
import 'package:galia_menu/FirebaseServices/DatabaseService.dart';
import 'package:galia_menu/Models/Products.dart';
import 'package:galia_menu/Products/MobileProductList.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  Widget categoryCard(BuildContext context, String category, String image) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StreamProvider<List<Products>>.value(
                  initialData: [],
                  value: DatabaseService().productList(category),
                  child: MobileProductList(key, category)))),
      child: Container(
        width: double.infinity,
        height: 170,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.overlay)),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.grey,
                offset: new Offset(0.0, 3.0),
                blurRadius: 5.0,
              )
            ]),
        child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              category,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Promos
            categoryCard(context, 'Promos', 'Images/Promos.jpg'),
            SizedBox(height: 15),
            //Café
            categoryCard(context, 'Café', 'Images/Café.jpg'),
            SizedBox(height: 15),
            //Panadería
            categoryCard(context, 'Panadería', 'Images/Panadería.jpg'),
            SizedBox(height: 15),
            //Postres
            categoryCard(context, 'Platos', 'Images/Platos.jpg'),
            SizedBox(height: 15),
            //Platos
            categoryCard(context, 'Postres', 'Images/Postres.jpg'),
            SizedBox(height: 15),
            //Bebidas
            categoryCard(context, 'Bebidas', 'Images/Bebidas Frías.jpg'),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
