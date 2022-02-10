import 'package:flutter/material.dart';

import '../../../../core/init/constants/border_constants.dart';
import '../../../../core/init/constants/button_size_constants.dart';
import '../../../../core/init/constants/dollar_size_constants.dart';
import '../../../../core/init/constants/image_constants.dart';
import '../../../../core/init/constants/margin_constants.dart';
import '../../../../core/init/constants/padding_constants.dart';
import '../../../../core/init/enums/star_size_enum.dart';
import '../../../../core/init/theme/color_scheme.dart';
import '../../../../core/widgets/add_button.dart';
import '../../../../core/widgets/dollar_sign.dart';
import '../../../../core/widgets/star.dart';

class TopFlavours extends StatefulWidget {
  const TopFlavours({Key? key, required this.width, required this.height, required this.rate, required this.price}) : super(key: key);

  final double width, height;
  final double rate, price, reviewCount = 230;
  final String title = "Vanilla Ice Cream";

  @override
  _TopFlavoursState createState() => _TopFlavoursState();
}

class _TopFlavoursState extends State<TopFlavours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: topFlavoursText()),
        Expanded(flex: 5, child: iceCreamCard()),
      ],
    );
  }

  Widget topFlavoursText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text("Top Flavours", style: Theme.of(context).textTheme.headline6),
    );
  }

  Card iceCreamCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusMedium)),
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      color: HomeColorScheme.instance?.vanillaDark,
      child: Row(
        children: [
          Expanded(flex: 1, child: iceCreamPhoto()),
          Expanded(flex: 1, child: iceCreamInfo()),
        ],
      ),
    );
  }

  Widget iceCreamInfo() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Expanded(flex: 2, child: iceCreamName()),
          Expanded(flex: 3, child: amountAndRateRow()),
          Expanded(flex: 3, child: priceAndButtonRow()),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Row priceAndButtonRow() {
    return Row(
      children: [
        DollarSign(size: DollarSizeConstants.instance.sizeMedium),
        priceText(),
        const Spacer(flex: 2),
        AddButton(size: ButtonSizeConstants.instance.max, productName: 'Vanilla'),
        const Spacer(flex: 1),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Text priceText() {
    return Text(widget.price.toStringAsFixed(2), style: Theme.of(context).textTheme.headline6);
  }

  Row amountAndRateRow() {
    return Row(
      children: [
        Expanded(flex: 2, child: iceCreamAmount()),
        const Spacer(flex: 1),
        Expanded(flex: 2, child: iceCreamRate()),
        const Spacer(flex: 1),
      ],
    );
  }

  Widget iceCreamRate() {
    return Row(
      children: [
        const Expanded(flex: 1, child: StarImage(isEmpty: false, size: StarSizes.MIN)),
        Expanded(flex: 1, child: rateValue()),
      ],
    );
  }

  Text rateValue() {
    return Text(
      widget.rate.toStringAsFixed(1),
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Widget iceCreamAmount() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: PaddingConstants.instance.paddingMin),
      decoration: amountDecoration(),
      child: Center(child: Text("1 KG", style: Theme.of(context).textTheme.subtitle2), heightFactor: 1),
    );
  }

  BoxDecoration amountDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusLow),
      color: HomeColorScheme.instance?.yellow,
    );
  }

  Text iceCreamName() => Text(widget.title, style: Theme.of(context).textTheme.headline6);

  Widget iceCreamPhoto() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingHigh),
      child: SizedBox(
        child: Image.asset(ImageConstants.instance.vanilla),
      ),
    );
  }
}
