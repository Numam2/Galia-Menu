import 'package:flutter/material.dart';
import 'package:galia_menu/Models/Products.dart';

class MobileProductDetails extends StatefulWidget {
  final String product;
  final String image;
  final double price;
  final String description;
  final bool available;
  final int time;
  final bool vegan;
  final List<PriceOptions> priceOptions;

  const MobileProductDetails(
      this.price,
      this.product,
      this.image,
      this.description,
      this.available,
      this.time,
      this.vegan,
      this.priceOptions);

  @override
  _MobileProductDetailsState createState() => _MobileProductDetailsState();
}

class _MobileProductDetailsState extends State<MobileProductDetails> {
  int productQuantity = 1;
  double selectedPrice = 0;

  @override
  void initState() {
    selectedPrice = widget.price;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Image + Cornered detail box
              Container(
                width: double.infinity,
                child: Stack(clipBehavior: Clip.none, children: [
                  ///Product Image
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover,
                            colorFilter: (!widget.available)
                                ? ColorFilter.mode(Colors.grey, BlendMode.hue)
                                : ColorFilter.mode(
                                    Colors.transparent, BlendMode.color),
                          ))),
                  //Back Button
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black54,
                            ),
                            child: Icon(Icons.keyboard_arrow_left,
                                color: Colors.white)),
                      ),
                    ),
                  ),
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

              ///Vegan
              (widget.vegan)
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 30,
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: DecorationImage(
                              image: AssetImage('Images/Vegan.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(height: 20),

              (widget.vegan) ? SizedBox(height: 10) : Container(),

              ///Product Name
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  widget.product,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),

              ///Product Price (Can change on size)
              Text(
                (!widget.available)
                    ? '\$$selectedPrice • No disponible'
                    : '\$$selectedPrice',
                style: TextStyle(
                    fontSize: (!widget.available) ? 16 : 20,
                    color: (!widget.available) ? Colors.grey : Colors.black87),
                textAlign: TextAlign.center,
              ),

              ///Product Description
              SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.85),
                child: Text(
                  '${widget.description}',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ),

              //Price Options
              (widget.priceOptions.length == 0)
                  ? Container()
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.priceOptions.length,
                          itemBuilder: (context, x) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: (widget.priceOptions[x] ==
                                          widget.priceOptions.last)
                                      ? BorderSide(
                                          width: 0.0,
                                          color: Colors.white,
                                          style: BorderStyle.none)
                                      : BorderSide(
                                          width: 0.35,
                                          color: Colors.grey.shade400,
                                          style: BorderStyle.solid),
                                ),
                              ),
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //Option
                                    Text('${widget.priceOptions[x].option}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                    Spacer(),
                                    //Price
                                    Text('\$${widget.priceOptions[x].price}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal)),
                                  ]),
                            );
                          })),

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
      ),
    );
  }
}
