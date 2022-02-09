import 'package:flutter/material.dart';
import 'package:ice_cream_shop/core/init/constants/button_size_constants.dart';
import 'package:ice_cream_shop/core/init/constants/dollar_size_constants.dart';
import 'package:ice_cream_shop/core/init/theme/color_scheme.dart';
import 'package:ice_cream_shop/core/widgets/add_button.dart';
import 'package:ice_cream_shop/core/widgets/dollar_sign.dart';

import '../../../core/init/constants/image_constants.dart';
import '../../../core/init/constants/margin_constants.dart';

class TopItem extends StatefulWidget {
  TopItem({Key? key, required this.height, required this.width}) : super(key: key);

  final double height, width;

  final List<Color?> colors = [
    HomeColorScheme.instance?.pingkLight,
    HomeColorScheme.instance?.blueLight,
  ];

  final List<Image> images = [
    Image.asset(ImageConstants.instance.item1),
    Image.asset(ImageConstants.instance.item2),
  ];

  final List<String> flavourNames = [
    "First Flavour",
    "Second Flavour",
  ];

  final List<String> flavourDescription = [
    "With strawberry and lemon jam",
    "With vanilla and caramel",
  ];

  final List<double> prices = [
    14.6,
    18.9,
  ];

  @override
  _TopItemState createState() => _TopItemState();
}

class _TopItemState extends State<TopItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: topItemText(context)),
        Expanded(
          flex: 15,
          child: Row(
            children: [
              Expanded(
                child: flavourCard(
                  flavourName: widget.flavourNames[0],
                  flavourDescription: widget.flavourDescription[0],
                  color: widget.colors[0],
                  image: widget.images[0],
                  price: widget.prices[0],
                ),
              ),
              Expanded(
                child: flavourCard(
                  flavourName: widget.flavourNames[1],
                  flavourDescription: widget.flavourDescription[1],
                  color: widget.colors[1],
                  image: widget.images[1],
                  price: widget.prices[1],
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ],
    );
  }

  Card flavourCard({required Color? color, required String flavourDescription, required String flavourName, required Image image, required double price}) {
    return Card(
      margin: EdgeInsets.all(MarginConstants.instance.marginHigh),
      color: color,
      child: Column(
        children: [
          Expanded(flex: 6, child: image),
          Expanded(flex: 1, child: Text(flavourName)),
          Expanded(flex: 1, child: Text(flavourDescription)),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 1, child: DollarSign(size: DollarSizeConstants.instance.sizeMedium)),
                Expanded(flex: 1, child: Text(price.toStringAsFixed(2))),
                Expanded(flex: 1, child: AddButton(size: ButtonSizeConstants.instance.medium)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget topItemText(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text("Top Item", style: Theme.of(context).textTheme.headline6),
    );
  }
}
