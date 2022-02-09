import 'package:flutter/material.dart';
import 'package:ice_cream_shop/core/init/constants/button_size_constants.dart';
import 'package:ice_cream_shop/core/init/constants/dollar_size_constants.dart';
import 'package:ice_cream_shop/core/init/constants/padding_constants.dart';
import 'package:ice_cream_shop/core/init/theme/color_scheme.dart';
import 'package:ice_cream_shop/core/widgets/add_button.dart';
import 'package:ice_cream_shop/core/widgets/dollar_sign.dart';

import '../../../core/init/constants/border_constants.dart';
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
    "With vanilla and caramel jam",
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
        Expanded(flex: 1, child: topItemText()),
        Expanded(
          flex: 10,
          child: Row(
            children: [
              Expanded(
                child: flavourCard(
                  flavourName: widget.flavourNames[0],
                  flavourDescription: widget.flavourDescription[0],
                  color: widget.colors[0],
                  image: widget.images[0],
                  price: widget.prices[0],
                  isLeft: true,
                ),
              ),
              Expanded(
                child: flavourCard(
                  flavourName: widget.flavourNames[1],
                  flavourDescription: widget.flavourDescription[1],
                  color: widget.colors[1],
                  image: widget.images[1],
                  price: widget.prices[1],
                  isLeft: false,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        )
      ],
    );
  }

  Card flavourCard({required Color? color, required String flavourDescription, required String flavourName, required Image image, required double price, required bool isLeft}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusMedium)),
      margin: flavourMargin(isLeft),
      color: color,
      child: Padding(
        padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 10, child: Center(child: image)),
            Expanded(flex: 2, child: flavourTitleWidget(flavourName)),
            Expanded(flex: 3, child: flavourDescWidget(flavourDescription)),
            Expanded(flex: 3, child: priceRow(price, color, image, flavourName)),
          ],
        ),
      ),
    );
  }

  Text flavourDescWidget(String flavourDescription) {
    return Text(flavourDescription, style: Theme.of(context).textTheme.bodyText1);
  }

  Text flavourTitleWidget(String flavourName) {
    return Text(flavourName, style: Theme.of(context).textTheme.headline6);
  }

  EdgeInsets flavourMargin(bool isLeft) {
    if (isLeft) {
      return EdgeInsets.fromLTRB(MarginConstants.instance.marginHigh, MarginConstants.instance.marginMedium, MarginConstants.instance.marginMin, MarginConstants.instance.marginHigh);
    } else {
      return EdgeInsets.fromLTRB(MarginConstants.instance.marginMin, MarginConstants.instance.marginMedium, MarginConstants.instance.marginHigh, MarginConstants.instance.marginHigh);
    }
  }

  Widget priceRow(double price, Color? color, Image image, String flavourName) {
    return Row(
      children: [
        Expanded(flex: 1, child: DollarSign(size: DollarSizeConstants.instance.sizeMedium)),
        Expanded(flex: 4, child: priceText(price)),
        Expanded(
            flex: 2,
            child: AddButton(
              size: ButtonSizeConstants.instance.medium,
              color: color,
              image: image,
              productName: flavourName,
              productPrice: price,
              productReviewCount: 123,
              productScore: 3.6,
            )),
      ],
    );
  }

  Text priceText(double price) => Text(price.toStringAsFixed(2), style: Theme.of(context).textTheme.headline6);

  Widget topItemText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text("Top Item", style: Theme.of(context).textTheme.headline6),
    );
  }
}
