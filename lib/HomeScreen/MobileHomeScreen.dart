import 'package:flutter/material.dart';
import 'package:galia_website/FirebaseServices/DatabaseService.dart';
import 'package:galia_website/Models/Products.dart';
import 'package:galia_website/Products/MobileProductList.dart';
import 'package:galia_website/Products/MobilePromoList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MobileHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                SizedBox(height: 20),
                ///Promos Section
                Container(
                  child: StreamProvider<List<Products>>.value(
                    value: DatabaseService().productList('Promos'),
                    child: MobilePromoList())),
                SizedBox(height: 10),
                ///Café Section
                Container( 
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12),
                        child: Text(
                          'Café',
                          style: GoogleFonts.lobsterTwo(
                            fontSize: 30, fontWeight: FontWeight.bold                        
                          ),
                        ),
                      ),
                      ///List of products
                      Container(
                        constraints: BoxConstraints(maxHeight: 220),
                        child: StreamProvider<List<Products>>.value(
                          value: DatabaseService().productList('Café'),
                          child: MobileProductList())),
                    ],
                  ),
                ),
                ///Postres Section
                Container(
                  width: double.infinity,        
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          'Postres',
                          style: GoogleFonts.lobsterTwo(
                            fontSize: 30, fontWeight: FontWeight.bold                        
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ///List of products
                      Container(
                        constraints: BoxConstraints(maxHeight: 220),
                        child: StreamProvider<List<Products>>.value(
                          value: DatabaseService().productList('Postres'),
                          child: MobileProductList())),
                    ],
                  ),
                ),                
                ///Sandwiches/Ensaladas Section
                Container(
                  width: double.infinity,        
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          'Sandwiches y Ensaladas',
                          style: GoogleFonts.lobsterTwo(
                            fontSize: 30, fontWeight: FontWeight.bold                        
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ///List of products
                      Container(
                        constraints: BoxConstraints(maxHeight: 220),
                        child: StreamProvider<List<Products>>.value(
                          value: DatabaseService().productList('Sandwich y Ensaladas'),
                          child: MobileProductList())),
                    ],
                  ),
                ),
                ///Panadería
                Container(
                  width: double.infinity,        
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Title
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          'Panadería',
                          style: GoogleFonts.lobsterTwo(
                            fontSize: 30, fontWeight: FontWeight.bold                        
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ///List of products
                      Container(
                        constraints: BoxConstraints(maxHeight: 220),
                        child: StreamProvider<List<Products>>.value(
                          value: DatabaseService().productList('Panadería'),
                          child: MobileProductList())),
                    ],
                  ),
                ),
                SizedBox(height: 10)
              ]
            ),
          ),
        );
  }
}