import 'package:flutter/material.dart';
import '../../../../core/init/constants/border_constants.dart';
import '../../../../core/init/constants/button_size_constants.dart';
import '../../../../core/init/constants/dollar_size_constants.dart';
import '../../../../core/init/constants/image_constants.dart';
import '../../../../core/init/constants/margin_constants.dart';
import '../../../../core/init/constants/padding_constants.dart';
import '../../../../core/init/theme/color_scheme.dart';
import '../../../../core/widgets/add_button.dart';
import '../../../../core/widgets/dollar_sign.dart';

class TopItem extends StatefulWidget {
  /// TopItem class constructor takes two parameter.
  /// [width] holds the width value of the device
  /// [height] holds the heigth value of the device
  TopItem({Key? key, required this.height, required this.width}) : super(key: key);

  final double height, width;

  // Since I used dummy data to represent top_item part of the home_page I initialized the dummy datas here
  // Also made them private since they shouldn't be seen by the user.
  final List<Color?> _colors = [
    HomeColorScheme.instance?.pingkLight,
    HomeColorScheme.instance?.blueLight,
  ];

  final List<Image> _images = [
    Image.asset(ImageConstants.instance.item1),
    Image.asset(ImageConstants.instance.item2),
  ];

  final List<String> _flavourNames = [
    "First Flavour",
    "Second Flavour",
  ];

  final List<String> _flavourDescription = [
    "With strawberry and lemon jam",
    "With vanilla and caramel jam",
  ];

  final List<double> _prices = [
    19.8,
    20.99,
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
        Expanded(flex: 1, child: _topItemText()),
        Expanded(flex: 10, child: _flavourCardRow()),
      ],
    );
  }

  Widget _topItemText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text("Top Item", style: Theme.of(context).textTheme.headline6),
    );
  }

  Row _flavourCardRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _flavourCard(
            flavourName: widget._flavourNames[0],
            flavourDescription: widget._flavourDescription[0],
            color: widget._colors[0],
            image: widget._images[0],
            price: widget._prices[0],
            isLeft: true,
          ),
        ),
        Expanded(
          child: _flavourCard(
            flavourName: widget._flavourNames[1],
            flavourDescription: widget._flavourDescription[1],
            color: widget._colors[1],
            image: widget._images[1],
            price: widget._prices[1],
            isLeft: false,
          ),
        ),
      ],
    );
  }

  Card _flavourCard({required Color? color, required String flavourDescription, required String flavourName, required Image image, required double price, required bool isLeft}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusMedium)),
      margin: _flavourMargin(isLeft),
      color: color,
      child: Padding(
        padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
        child: _cardColumn(image, flavourName, flavourDescription, price, color),
      ),
    );
  }

  EdgeInsets _flavourMargin(bool isLeft) {
    if (isLeft) {
      return EdgeInsets.fromLTRB(
        MarginConstants.instance.marginHigh,
        MarginConstants.instance.marginMedium,
        MarginConstants.instance.marginMin,
        MarginConstants.instance.marginHigh,
      );
    } else {
      return EdgeInsets.fromLTRB(
        MarginConstants.instance.marginMin,
        MarginConstants.instance.marginMedium,
        MarginConstants.instance.marginHigh,
        MarginConstants.instance.marginHigh,
      );
    }
  }

  Column _cardColumn(Image image, String flavourName, String flavourDescription, double price, Color? color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 10, child: Center(child: image)),
        Expanded(flex: 2, child: _flavourTitleWidget(flavourName)),
        Expanded(flex: 3, child: _flavourDescWidget(flavourDescription)),
        Expanded(flex: 3, child: _priceRow(price, color, image, flavourName)),
      ],
    );
  }

  Text _flavourTitleWidget(String flavourName) => Text(flavourName, style: Theme.of(context).textTheme.headline6);

  Text _flavourDescWidget(String flavourDescription) => Text(flavourDescription, style: Theme.of(context).textTheme.bodyText1);

  Widget _priceRow(double price, Color? color, Image image, String flavourName) {
    return Row(
      children: [
        Expanded(flex: 1, child: DollarSign(size: DollarSizeConstants.instance.sizeMedium)),
        Expanded(flex: 4, child: _priceText(price)),
        Expanded(flex: 2, child: AddButton(size: ButtonSizeConstants.instance.medium, productName: flavourName)),
      ],
    );
  }

  Text _priceText(double price) => Text(price.toStringAsFixed(2), style: Theme.of(context).textTheme.headline6);
}
