import 'package:flutter/material.dart';
import 'package:mobile/body_part.dart';
import 'package:mobile/classOfProducts.dart';
import 'package:mobile/login.dart';
import 'package:mobile/productAdd.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isVerified = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => BodyPart(),
        '/home': (context) => BodyPart(),
        '/addProduct': (context) => isVerified ? AddProducts(onProductAdded: onProductAdded) : LoginPage(onSuccess: () {
              isVerified = true;
              Navigator.pushNamed(context, '/addProduct');
            }),
      },
    );
  }

  void onProductAdded(ProductClass product) {
    print('New product added: ${product.name}');
  }
}
