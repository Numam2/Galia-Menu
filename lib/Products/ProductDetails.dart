import 'package:flutter/material.dart';
import 'package:galia_website/Products/DesktopProductDetails.dart';
import 'package:galia_website/Products/MobileProductDetails.dart';

class ProductDetails extends StatelessWidget {

  final String product;
  final int price;
  final String image;
  final List options;
  final String description;
  final String category;
  final bool milkOptions;

  ProductDetails({this.product, this.price, this.image, this.options, this.description, this.category, this.milkOptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,          
          centerTitle: true,
          title: Container(
            height: 20,
            child: Image(image: AssetImage('images/GaliaLogo.png')),
          ), 
          leading: Builder(
            builder:(context) => InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(width: 60, height: double.infinity, child: Icon(Icons.arrow_back_ios, color: Colors.black, size:20)),
            ),
          ),
        //   actions:<Widget>[
        //   InkWell(
        //     onTap: ()=> print('Abrir carrito'),
        //     child: Container(width: 60, height: double.infinity, child: Icon(Icons.shopping_cart, color: Colors.black, size:20)),
        //   ),
        // ],
      ),
      body:LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 650) {
            return Container(
              width: double.infinity,
              child: DesktopProductDetails(product: product, image: image, price: price, description: description, options: options, category: category, milkOptions: milkOptions,));
          } else {
            return MobileProductDetails(product: product, image: image, price: price, description: description, options: options, category: category, milkOptions: milkOptions);
          }
        },
      ), 
    );
  }
}