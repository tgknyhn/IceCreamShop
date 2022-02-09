import 'package:flutter/material.dart';
import '../../view/product/product_page.dart';
import '../init/theme/color_scheme.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.size,
    required this.productName,
    required this.productScore,
    required this.productReviewCount,
    required this.productPrice,
    required this.image,
    required this.color,
  }) : super(key: key);

  final String productName;
  final double productScore, productReviewCount, productPrice;
  final Image image;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: HomeColorScheme.instance?.pink,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => ProductPage(
                    color: color,
                    image: image,
                    productName: productName,
                    productPrice: productPrice,
                    productReviewCount: productReviewCount,
                    productScore: productScore,
                  )),
            ),
          );
        },
        icon: Icon(
          Icons.add,
          color: HomeColorScheme.instance?.white,
          size: size * 0.8,
        ),
        iconSize: size,
      ),
    );
  }
}
