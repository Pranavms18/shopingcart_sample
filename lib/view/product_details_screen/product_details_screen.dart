// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'package:shopingcart_sample/controller/product_details_controller.dart';

// class productDetailsScreen extends StatefulWidget {
//   productDetailsScreen({
//     super.key,
//     required this.productId,
//   });
//   int productId;

//   @override
//   State<productDetailsScreen> createState() => _productDetailsScreenState();
// }

// class _productDetailsScreenState extends State<productDetailsScreen> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (timeStamp) {
//         context
//             .read<ProductDetailsController>()
//             .getProductDetails(widget.productId);
//       },
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Details"),
//           actions: [
//             Stack(
//               children: [
//                 Icon(
//                   Icons.notifications_none_outlined,
//                   color: Colors.black,
//                   size: 35,
//                 ),
//                 Positioned(
//                     right: 0,
//                     top: 3,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.black,
//                       radius: 10,
//                       child: Text(
//                         "1",
//                         style: TextStyle(color: Colors.white, fontSize: 8),
//                       ),
//                     ))
//               ],
//             ),
//             SizedBox(
//               width: 15,
//             )
//           ],
//         ),
//         body: Consumer<ProductDetailsController>(
//           builder: (context, productDetailsObj, child) => productDetailsObj
//                   .isLoading
//               ? Center(child: CircularProgressIndicator())
//               : Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Stack(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image: NetworkImage(productDetailsObj
//                                           .product!.image
//                                           .toString()))),
//                             ),
//                             Positioned(
//                               top: 10,
//                               right: 10,
//                               child: Container(
//                                 height: 40,
//                                 width: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(12)),
//                                 child: Icon(Icons.favorite_outline),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Padding(padding: EdgeInsets.only(left: 8)),
//                       Text(
//                         productDetailsObj.product!.title.toString(),
//                         style: TextStyle(
//                             fontSize: 16, fontWeight: FontWeight.w700),
//                       ),
//                       SizedBox(
//                         height: 1,
//                       ),
//                       Padding(padding: EdgeInsets.only(left: 8)),
//                       Text(
//                         productDetailsObj.product!.price.toString(),
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.grey),
//                       ),
//                       Text(
//                         productDetailsObj.product!.description.toString(),
//                         style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w300,
//                             color: Colors.grey),
//                       )
//                     ],
//                   ),
//                 ),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopingcart_sample/controller/cart_screen_controller.dart';
import 'package:shopingcart_sample/controller/product_details_controller.dart';
import 'package:shopingcart_sample/view/cart_screen/cart_screen.dart';

class productDetailsScreen extends StatefulWidget {
  const productDetailsScreen({super.key, required this.productId});
  final int productId;

  @override
  State<productDetailsScreen> createState() => _productDetailsScreenState();
}

class _productDetailsScreenState extends State<productDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => context
          .read<ProductDetailsController>()
          .getProductDetails(widget.productId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: const [
            Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                    right: 0,
                    top: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 7,
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Consumer<ProductDetailsController>(
            builder: (context, productDetailsObj, child) => productDetailsObj
                    .isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              alignment: Alignment.topRight,
                              height: 400,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(productDetailsObj
                                          .product!.image
                                          .toString()))),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.favorite_outline,
                                  size: 30,
                                ),
                              ),
                            ),
                            Text(
                              productDetailsObj.product!.title.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  productDetailsObj.product!.rating!.rate
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              productDetailsObj.product!.description.toString(),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Choose size",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      border: Border.all(
                                          width: 2, color: Colors.grey)),
                                  child: Center(
                                      child: Text(
                                    "S",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      border: Border.all(
                                          width: 2, color: Colors.grey)),
                                  child: Center(
                                      child: Text(
                                    "M",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      border: Border.all(
                                          width: 2, color: Colors.grey)),
                                  child: Center(
                                      child: Text(
                                    "L",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Price",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                            Text(
                              productDetailsObj.product!.price.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(width: 50),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<CartScreenController>()
                                  .addProduct(productDetailsObj.product!);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_mall_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Add to cart",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ]),
                    )
                  ])));
  }
}
