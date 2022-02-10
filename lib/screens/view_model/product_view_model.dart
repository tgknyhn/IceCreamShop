import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream_shop/core/init/theme/color_scheme.dart';

import '../../models/product_model.dart';
import '../view/product/product_page.dart';

class ProductViewModel {
  static ProductViewModel? _instace;
  static ProductViewModel get instance => _instace ??= ProductViewModel._init();

  ProductViewModel._init();

  void goToProductPage({required BuildContext context, required String productName}) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference products = firestore.collection('products');

    print('product name: $productName');

    products.where('productName', isEqualTo: productName).get().then((value) {
      DocumentSnapshot productDoc = value.docs[0];

      Map<String, dynamic> product = productDoc.data() as Map<String, dynamic>;

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) => ProductPage(
                product: Product(
                  name: product['productName'],
                  image: Image.asset(product['productImage']),
                  price: product['productPrice'] * 1.0,
                  score: product['productScore'] * 1.0,
                  darkColor: HomeColorScheme.instance?.getColor(product['productDarkColor']),
                  lightColor: HomeColorScheme.instance?.getColor(product['productLightColor']),
                  reviewCount: product['productReviewCount'] * 1.0,
                  subtitle: product['productSubtitle'],
                  description: product['productDescription'],
                ),
              )),
        ),
      );
    });
  }
}
