import 'package:flutter/material.dart';
import 'package:ice_cream_shop/screens/view_model/product_view_model.dart';

import '../../screens/view/product/product_page.dart';
import '../init/theme/color_scheme.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.size,
    required this.productName,
  }) : super(key: key);

  final double size;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: HomeColorScheme.instance?.pink,
      child: IconButton(
        onPressed: () => ProductViewModel.instance.goToProductPage(context: context, productName: productName),
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
