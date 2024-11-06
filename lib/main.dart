import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingcart_sample/controller/cart_screen_controller.dart';
import 'package:shopingcart_sample/controller/home_screen_controller.dart';
import 'package:shopingcart_sample/controller/product_details_controller.dart';

import 'package:shopingcart_sample/view/home_screen/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomescreenController(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductDetailsController(),
    ),
    ChangeNotifierProvider(
      create: (context) => CartScreenController(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
