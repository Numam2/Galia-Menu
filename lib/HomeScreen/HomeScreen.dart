import 'package:flutter/material.dart';
import 'package:galia_website/HomeScreen/DesktopHomeScreen.dart';
import 'package:galia_website/HomeScreen/MobileHomeScreen.dart';

class HomeScreen extends StatelessWidget {

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
          // leading: Builder(
          //   builder:(context) => InkWell(
          //     onTap: (){
          //       Scaffold.of(context).openDrawer();
          //     },
          //     child: Container(width: 60, height: double.infinity, child: Icon(Icons.menu, color: Colors.black, size:20)),
          //   ),
          // ),
        //   actions:<Widget>[
        //   InkWell(
        //     onTap: ()=> print('Abrir carrito'),
        //     child: Container(width: 60, height: double.infinity, child: Icon(Icons.shopping_cart, color: Colors.black, size:20)),
        //   ),
        // ],
      ),  
      // drawer: Drawer(
      //   child: Container(
      //     color: Colors.black,
      //     child: Padding(
      //       padding: const EdgeInsets.all(30.0),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children:<Widget>[
                
      //           // Picture
                

      //         ]
      //       ),
      //     ),
      //   )
      // ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 650) {
            return DesktopHomeScreen();
          } else {
            return MobileHomeScreen();
          }
        },
      ),
    );
  }
}
