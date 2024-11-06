import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shopingcart_sample/model/home_screen_model.dart';
import 'package:sqflite/sqflite.dart';

class CartScreenController with ChangeNotifier {
  late Database myDatabase;

  double totalCartValue = 0.00;

  List<Map<String, dynamic>> storedProduct = [];
  Future initDb() async {
    myDatabase = await openDatabase("cartdb2.Db", version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Cart (id INTEGER PRIMARY KEY, title TEXT,qty INTEGER ,amount REAL,image TEXT, productId INTEGER)');
    });
  }

  Future getAllProduct() async {
    storedProduct = await myDatabase.rawQuery('SELECT * FROM Cart');
    log(storedProduct.toString());
    calculateAmount();
    notifyListeners();
  }

  Future addProduct(ProductModel selectedProduct) async {
    bool alreadyInCart = false;
    for (int i = 0; i < storedProduct.length; i++) {
      if (selectedProduct.id == storedProduct[i]["productId"]) {
        alreadyInCart = true;
      }
    }
    if (alreadyInCart) {
      log("already in cart");
    }
    await myDatabase.rawInsert(
        'INSERT INTO Cart(title, qty, amount,image,productId) VALUES(?, ?, ?, ?,?)',
        [
          selectedProduct.title,
          1,
          selectedProduct.price,
          selectedProduct.image,
          selectedProduct.id
        ]);

    getAllProduct();
  }

  incrementQty({required int currentQty, required int id}) async {
    await myDatabase
        .rawUpdate('UPDATE Cart SET qty = ?  WHERE id = ?', [++currentQty, id]);
    getAllProduct();
  }

  decrementQty({required int currentQty, required int id}) async {
    if (currentQty > 0) {
      await myDatabase.rawUpdate(
          'UPDATE Cart SET qty = ?  WHERE id = ?', [--currentQty, id]);
      getAllProduct();
    } else {}
  }

  Future removeProduct(int productId) async {
    await myDatabase.rawDelete('DELETE FROM Cart WHERE id = ?', [productId]);

    getAllProduct();
  }

  void calculateAmount() {
    totalCartValue = 0.00;
    for (int i = 0; i < storedProduct.length; i++) {
      totalCartValue =
          totalCartValue + storedProduct[i]["qty"] * storedProduct[i]["amount"];
    }
    log(totalCartValue.toString());
  }
}
