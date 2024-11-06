import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingcart_sample/controller/cart_screen_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<CartScreenController>().getAllProduct();

        log(context
            .read<CartScreenController>()
            .storedProduct
            .length
            .toString());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: Consumer<CartScreenController>(
          builder: (context, cartscreenObj, child) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      cartscreenObj.storedProduct.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: Container(
                          height: 210,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Image(
                                          image: NetworkImage(cartscreenObj
                                              .storedProduct[index]["image"])),
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            cartscreenObj.storedProduct[index]
                                                ["title"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500),
                                            maxLines: 3,
                                          ),
                                          Text(
                                            cartscreenObj.storedProduct[index]
                                                    ["amount"]
                                                .toString(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<CartScreenController>()
                                                  .incrementQty(
                                                      currentQty: cartscreenObj
                                                              .storedProduct[
                                                          index]["qty"],
                                                      id: cartscreenObj
                                                              .storedProduct[
                                                          index]["id"]);
                                            },
                                            child: Text("+")),
                                        Text(cartscreenObj.storedProduct[index]
                                                ["qty"]
                                            .toString()),
                                        ElevatedButton(
                                            onPressed: () {
                                              context
                                                  .read<CartScreenController>()
                                                  .decrementQty(
                                                    currentQty: cartscreenObj
                                                            .storedProduct[
                                                        index]["qty"],
                                                    id: cartscreenObj
                                                            .storedProduct[
                                                        index]["id"],
                                                  );
                                            },
                                            child: Text("-"))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<CartScreenController>()
                                        .removeProduct(cartscreenObj
                                            .storedProduct[index]["id"]);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Text(
                        "Total amount",
                        style: TextStyle(
                            color: Color.fromARGB(255, 235, 26, 12),
                            fontSize: 20),
                      ),
                      Text(cartscreenObj.totalCartValue.toStringAsFixed(2)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
