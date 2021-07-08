import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:galia_menu/HomeScreen/HomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cafe Galia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.black,
        hoverColor: Colors.white70,
      ),
      home: HomeScreen(),
    );
  }
}
