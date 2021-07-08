import 'package:flutter/material.dart';
import 'package:galia_menu/FirebaseServices/DatabaseService.dart';
import 'package:galia_menu/Models/Products.dart';
import 'package:galia_menu/Products/DesktopProductList.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DesktopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Promos Section
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20),
                      child: Text(
                        'Promos',
                        style: GoogleFonts.lobsterTwo(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///List of products
                    Container(
                        child: StreamProvider<List<Products>>.value(
                            initialData: [],
                            value: DatabaseService().productList('Promos'),
                            child: DesktopProductList())),
                  ],
                ),
              ),

              ///Café Section
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20),
                      child: Text(
                        'Café',
                        style: GoogleFonts.lobsterTwo(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///List of products
                    Container(
                        child: StreamProvider<List<Products>>.value(
                            initialData: [],
                            value: DatabaseService().productList('Café'),
                            child: DesktopProductList())),
                  ],
                ),
              ),

              ///Postres Section
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20),
                      child: Text(
                        'Postres',
                        style: GoogleFonts.lobsterTwo(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///List of products
                    Container(
                        child: StreamProvider<List<Products>>.value(
                            initialData: [],
                            value: DatabaseService().productList('Postres'),
                            child: DesktopProductList())),
                  ],
                ),
              ),

              ///Sandwiches Section
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20),
                      child: Text(
                        'Sandwiches',
                        style: GoogleFonts.lobsterTwo(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///List of products
                    Container(
                        child: StreamProvider<List<Products>>.value(
                            initialData: [],
                            value: DatabaseService()
                                .productList('Sandwich y Ensaladas'),
                            child: DesktopProductList())),
                  ],
                ),
              ),

              ///Panadería Section
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 20),
                      child: Text(
                        'Panadería',
                        style: GoogleFonts.lobsterTwo(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///List of products
                    Container(
                        child: StreamProvider<List<Products>>.value(
                            initialData: [],
                            value: DatabaseService().productList('Panadería'),
                            child: DesktopProductList())),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
