import 'package:flutter/material.dart';
import 'package:galia_menu/Models/Products.dart';
import 'package:galia_menu/Products/MobileProductDetails.dart';
import 'package:provider/provider.dart';

class MobileProductList extends StatelessWidget {
  final String category;
  const MobileProductList(Key? key, this.category) : super(key: key);

  Widget productCard(
      BuildContext context,
      String product,
      double price,
      String image,
      String description,
      bool available,
      int time,
      bool vegan,
      List<PriceOptions> priceOptions) {
    return Container(
      height: 160,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MobileProductDetails(
                      price,
                      product,
                      image,
                      description,
                      available,
                      time,
                      vegan,
                      priceOptions)));
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Pic
              (image.length > 0)
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: double.infinity,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                          colorFilter: (!available)
                              ? ColorFilter.mode(Colors.grey, BlendMode.hue)
                              : ColorFilter.mode(
                                  Colors.transparent, BlendMode.color),
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(width: 20),
              //Description
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Product
                  Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.5),
                      child: Text('$product',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: (!available) ? Colors.grey : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.normal))),
                  SizedBox(height: 8),
                  //Description
                  (description.length > 0)
                      ? Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.5),
                          child: Text('$description',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: (!available)
                                      ? Colors.grey
                                      : Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal)))
                      : Container(),
                  SizedBox(height: description.length > 0 ? 8 : 0),
                  //Time/Vegan
                  (!vegan && time == 0)
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              //Icon
                              (time == 0)
                                  ? Container()
                                  : Icon(Icons.timer,
                                      color: Colors.grey, size: 15),
                              (time == 0) ? Container() : SizedBox(width: 5),
                              //Time
                              (time == 0)
                                  ? Container()
                                  : Text('$time min',
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey)),
                              (time == 0) ? Container() : SizedBox(width: 10),
                              vegan
                                  ? Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                          image: AssetImage('Images/Vegan.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ]),
                  SizedBox(height: 8),
                  //Price
                  (!available)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              Text('\$$price',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 15),
                              Text('No disponible',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold))
                            ])
                      : Text('\$$price',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<List<Products>>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 18,
              )),
            )),
        title: Container(
          height: 20,
          child: Text(category,
              style: TextStyle(color: Colors.black, fontSize: 16)),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        child: (product.length == 0)
            ? ListView.builder(
                itemCount: 4,
                itemBuilder: (context, i) {
                  return Padding(
                      padding: (i == 0)
                          ? EdgeInsets.only(top: 20.0)
                          : EdgeInsets.all(0),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //Pic
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: double.infinity,
                                  padding: EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                SizedBox(width: 20),
                                //Description
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //Product
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    //Description
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    //Time/Vegan
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          //Icon
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                            ),
                                          ),
                                        ]),
                                    SizedBox(height: 8),
                                    //Price
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[400],
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ));
                })
            : ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: (i == 0)
                        ? EdgeInsets.only(top: 20.0)
                        : EdgeInsets.all(0),
                    child: productCard(
                        context,
                        product[i].product,
                        product[i].price,
                        product[i].image,
                        product[i].description,
                        product[i].available,
                        product[i].time,
                        product[i].vegan,
                        product[i].priceOptions),
                  );
                }),
      ),
    );
  }
}
