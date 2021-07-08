import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:galia_menu/Models/Products.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DesktopProductList extends StatefulWidget {
  @override
  _DesktopProductListState createState() => _DesktopProductListState();
}

class _DesktopProductListState extends State<DesktopProductList> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<List<Products>>(context);

    print(product.length);

    // return Container();

    // if (product.first.description == '') {
    //   return Padding(
    //     padding: const EdgeInsets.all(20),
    //     child: GridView.builder(
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: (MediaQuery.of(context).size.width > 1100) ? 4 : 3,
    //         crossAxisSpacing: 15.0,
    //         mainAxisSpacing: 30.0,
    //         childAspectRatio: 0.85,
    //       ),
    //       scrollDirection: Axis.vertical,
    //       shrinkWrap: true,
    //       physics: NeverScrollableScrollPhysics(),
    //       itemCount: 4,
    //       itemBuilder: (context, index) {
    //         return InkWell(
    //           borderRadius: BorderRadius.all(Radius.circular(15)),
    //           hoverColor: Colors.black26,
    //           onTap:
    //               () {}, // => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails())),
    //           child: Container(
    //             constraints: BoxConstraints(
    //               minWidth: MediaQuery.of(context).size.width * 0.25,
    //             ),
    //             padding: EdgeInsets.all(5.0),
    //             child: Column(
    //               children: <Widget>[
    //                 ///Image
    //                 Container(
    //                   height: MediaQuery.of(context).size.width * 0.2,
    //                   width: double.infinity,
    //                   decoration: BoxDecoration(
    //                     color: Colors.grey[100],
    //                     borderRadius: BorderRadius.circular(15.0),
    //                   ),
    //                 ),
    //                 SizedBox(height: 10),

    //                 ///Text
    //                 Container(
    //                   height: 30,
    //                   width: double.infinity,
    //                   decoration: BoxDecoration(
    //                     color: Colors.grey[100],
    //                     borderRadius: BorderRadius.circular(20.0),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width > 1100) ? 4 : 3,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 30.0,
          childAspectRatio: 0.85,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: product.length,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            hoverColor: Colors.black26,
            onTap: () {},
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (context) => ProductDetails(
            //     product: product[index].product,
            //     image: product[index].image,
            //     price: product[index].price,
            //     category: product[index].category,
            //     options: product[index].options,
            //     description: product[index].description,
            //     milkOptions: product[index].milkOptions,
            //   ))),
            child: Container(
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width * 0.25,
              ),
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  ///Image
                  Container(
                    height: MediaQuery.of(context).size.width * 0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: NetworkImage(product[index].image),
                            fit: BoxFit.cover)),
                  ),

                  ///Text
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ///Product
                          Container(
                            child: Text(
                              product[index].product,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          ///Price
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '\$' + product[index].price.toString(),
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
