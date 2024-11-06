import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopingcart_sample/model/home_screen_model.dart';

class ProductDetailsController with ChangeNotifier {
  ProductModel? product;
  bool isLoading = false;

  Future<void> getProductDetails(int productId) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse("https://fakestoreapi.com/products/$productId");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        product = ProductModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
