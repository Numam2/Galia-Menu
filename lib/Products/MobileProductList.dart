import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:galia_website/Models/Products.dart';
import 'package:galia_website/Products/ProductDetails.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MobileProductList extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {

    final product = Provider.of<List<Products>>(context);

    if (product == null) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index){

          return Padding(
                padding: (index == 0) 
                  ? EdgeInsets.only(left: 20, right:10)
                  : EdgeInsets.only(left: 0,  right:10),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  hoverColor: Colors.black26,
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails())),
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                    child: Column(
                      children: <Widget>[
                        ///Image
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        SizedBox(height: 10),
                        ///Text
                        Container(
                          height: 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20.0),
                          ),                          
                        ),
                      ],
                    ),
                  ),
                ));
        },
        
      );
    }

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: product.length,
      itemBuilder: (context, index){

        return Padding(
              padding: (index == 0) 
                ? EdgeInsets.only(left: 20, right:10)
                : EdgeInsets.only(left: 0,  right:10),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                hoverColor: Colors.black26,
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: product[index].product,
                    image: product[index].image,
                    price: product[index].price,
                    description: product[index].description,
                    options: product[index].options,
                    milkOptions: product[index].milkOptions,
                  ))),
                child: Container(
                  width: 150,
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      ///Image
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(product[index].image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ///Text
                      Container(
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 115),
                              child: Text(
                                product[index].product,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 12.0),
                            child: Text(
                              '\$' + product[index].price.toString(),
                              textAlign: TextAlign.start,
                              style: GoogleFonts.montserrat(
                                color: Colors.black54,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ));
      },
      
    );
  }
}