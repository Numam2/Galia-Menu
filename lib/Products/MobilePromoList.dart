import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:galia_website/Models/Products.dart';
import 'package:galia_website/Products/ProductDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MobilePromoList extends StatelessWidget {
  navigatetoDetail(
      BuildContext context,
      String product,
      String image,
      int price,
      String description,
      List options,
      bool milkOptions,) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetails(
              product: product,
              image: image,
              price: price,
              description: description,
              options: options,
              milkOptions: milkOptions,)));
  }

  @override
  Widget build(BuildContext context) {
    
    final product = Provider.of<List<Products>>(context);

    if (product == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Container(
          height: MediaQuery.of(context).size.width * 0.50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      );
    }

    final List<Widget> imageSliders = product
        .map((item) => InkWell(
          onTap: () => navigatetoDetail(context,
            item.product,
            item.image,
            item.price,
            item.description,
            item.options,
            item.milkOptions,
          ),
          child: Container(
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: Stack(
                        children: <Widget>[
                          //Imagen
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            child: Image.network(item.image,
                                fit: BoxFit.cover),
                          ),
                          //Shadow with Text
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(200, 0, 0, 0),
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: EdgeInsets.all(20.0),
                              child: Container(
                                width: double.infinity,
                                child: Row(children: <Widget>[
                                  //Producto
                                  Container(
                                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.45),
                                    child: Text(
                                      item.product,
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Spacer(),
                                  //Precio
                                  Text(
                                    '\$' + item.price.toString(),
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.lobsterTwo(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
        ))
        .toList();

    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 1.5,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
        ),
        items: imageSliders);
   }
  }