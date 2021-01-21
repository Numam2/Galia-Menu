import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileProductDetails extends StatefulWidget {
  final String product;
  final String image;
  final int price;
  final List options;
  final String description;
  final String category;
  final bool milkOptions;

  MobileProductDetails(
      {this.price,
      this.product,
      this.image,
      this.options,
      this.description,
      this.category,
      this.milkOptions});

  @override
  _MobileProductDetailsState createState() => _MobileProductDetailsState();
}

class _MobileProductDetailsState extends State<MobileProductDetails> {
  int productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///Image + Cornered detail box
            Container(
              width: double.infinity,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                ///Product Image
                Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ))),
                //Product Description
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.47,
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                    ),
                  ),
                ),
              ]),
            ),

            ///Product Name
            Text(
              widget.product,
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            ///Product Price (Can change on size)
            Text(
              '\$${widget.price}',
              style:
                  GoogleFonts.lobsterTwo(fontSize: 20, color: Colors.black87),
              textAlign: TextAlign.center,
            ),

            ///Product Description
            SizedBox(height: 20),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.85),
              child: Text(
                '${widget.description}',
                style:
                    GoogleFonts.montserrat(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
            ),

            ///Product Options
            (widget.options.length > 0)
                ? Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 10),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Opciones',
                              style: GoogleFonts.montserrat(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ]),
                    ),
                  )
                : SizedBox(),
            (widget.options.length > 0)
                ? Container(
                    width: double.infinity,
                    constraints: BoxConstraints(maxHeight: 65),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    child: Center(
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: widget.options.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: (index == 0)
                                  ? EdgeInsets.fromLTRB(20, 0, 5, 0)
                                  : EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Center(
                                    child: Text(widget.options[index],
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 10))),
                              ),
                            );
                          }),
                    ),
                  )
                : SizedBox(height: 10),

            ///Milk Options
            (widget.milkOptions == true)
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 25),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          boxShadow: <BoxShadow>[
                            new BoxShadow(
                              color: Colors.grey[350],
                              offset: new Offset(0.0, 5.0),
                              blurRadius: 5.0,
                            )
                          ]),
                      child: Row(children: [
                        //Cow
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Column(children: [
                                //Image
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image:
                                            AssetImage('images/Cow Milk.png'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(height: 10),
                                //Name
                                Text(
                                  'Leche entera',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10, color: Colors.black),
                                )
                              ]),
                            ),
                          ),
                        ),
                        //Almond
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Column(children: [
                                //Image
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'images/Almond Milk.png'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(height: 10),
                                //Name
                                Text(
                                  'Leche de almendras',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10, color: Colors.black),
                                )
                              ]),
                            ),
                          ),
                        ),
                        //Soy
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Column(children: [
                                //Image
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image:
                                            AssetImage('images/Soy Milk.png'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                SizedBox(height: 10),
                                //Name
                                Text(
                                  'Leche de soja',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10, color: Colors.black),
                                )
                              ]),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  )
                : SizedBox(height: 20),
            //     // ///Product Quantity
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.center,
            //     //   crossAxisAlignment: CrossAxisAlignment.center,
            //     //   children: [
            //     //     //Less
            //     //     IconButton(
            //     //       icon: Icon(Icons.remove_circle_outline),
            //     //       onPressed: (){
            //     //         if(productQuantity > 1){
            //     //           setState(() {
            //     //             productQuantity = productQuantity - 1;
            //     //           });
            //     //         }
            //     //       },
            //     //     ),
            //     //     //Number
            //     //     Padding(
            //     //       padding: EdgeInsets.symmetric(horizontal: 20),
            //     //       child: Text(
            //     //         '$productQuantity',
            //     //         style: GoogleFonts.montserrat(
            //     //           fontSize: 16,
            //     //           color: Colors.black
            //     //         ),
            //     //       ),
            //     //     ),
            //     //     //More
            //     //     IconButton(
            //     //       icon: Icon(Icons.add_circle_outline),
            //     //       onPressed: (){
            //     //         setState(() {
            //     //             productQuantity = productQuantity + 1;
            //     //           });
            //     //       },
            //     //     ),
            //     // ],),
            //     // ///Add to cart button
            //     // Padding(
            //     //   padding: const EdgeInsets.all(20.0),
            //     //   child: SizedBox(
            //     //     width: double.infinity,
            //     //     child: RaisedButton(
            //     //       color: Colors.black,
            //     //       onPressed: ()=> print('Add to Order'),
            //     //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            //     //       child: Center(
            //     //         child: Text(
            //     //           'Agregar al pedido',
            //     //           style: GoogleFonts.montserrat(
            //     //             fontSize: 14,
            //     //             color: Colors.white
            //     //           ),
            //     //         )
            //     //       ),
            //     //     ),
            //     //   ),
            //     // ),
          ]),
    );
  }
}
