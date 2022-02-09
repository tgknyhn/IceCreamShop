import 'package:flutter/material.dart';
import '../../../core/init/constants/border_constants.dart';
import '../../../core/init/constants/button_size_constants.dart';
import '../../../core/init/constants/dollar_size_constants.dart';
import '../../../core/init/constants/image_constants.dart';
import '../../../core/init/constants/margin_constants.dart';
import '../../../core/init/constants/padding_constants.dart';
import '../../../core/init/enums/star_size_enum.dart';
import '../../../core/init/theme/color_scheme.dart';
import '../../../core/widgets/add_button.dart';
import '../../../core/widgets/dollar_sign.dart';
import '../../../core/widgets/star.dart';

class TopFlavours extends StatefulWidget {
  const TopFlavours({Key? key, required this.width, required this.height, required this.rate, required this.price}) : super(key: key);

  final double width, height;
  final double rate, price;

  @override
  _TopFlavoursState createState() => _TopFlavoursState();
}

class _TopFlavoursState extends State<TopFlavours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: topFlavoursText(context)),
        Expanded(flex: 5, child: iceCreamCard(context)),
      ],
    );
  }

  Widget topFlavoursText(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text(
        "Top Flavours",
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Card iceCreamCard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusMedium)),
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh, vertical: MarginConstants.instance.marginMedium),
      color: HomeColorScheme.instance?.pingkLight,
      child: Row(
        children: [
          Expanded(flex: 1, child: iceCreamPhoto()),
          Expanded(flex: 1, child: iceCreamInfo(context)),
        ],
      ),
    );
  }

  Widget iceCreamInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Expanded(flex: 2, child: iceCreamName(context)),
          Expanded(flex: 3, child: amountAndRateRow(context)),
          Expanded(flex: 3, child: priceAndButtonRow(context)),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Row priceAndButtonRow(BuildContext context) {
    return Row(
      children: [
        DollarSign(size: DollarSizeConstants.instance.sizeMedium),
        priceText(context),
        const Spacer(flex: 2),
        AddButton(size: ButtonSizeConstants.instance.max),
        const Spacer(flex: 1),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Text priceText(BuildContext context) {
    return Text(
      widget.price.toStringAsFixed(2),
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Row amountAndRateRow(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: iceCreamAmount(context)),
        const Spacer(flex: 1),
        Expanded(flex: 1, child: iceCreamRate(context)),
        const Spacer(flex: 1),
      ],
    );
  }

  Widget iceCreamRate(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 1, child: StarImage(isEmpty: false, size: StarSizes.MIN)),
        Expanded(flex: 1, child: rateValue(context)),
      ],
    );
  }

  Text rateValue(BuildContext context) {
    return Text(
      widget.rate.toStringAsFixed(1),
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Widget iceCreamAmount(BuildContext context) {
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

  Text iceCreamName(BuildContext context) => Text("Vanilla Ice Cream", style: Theme.of(context).textTheme.headline6);

  Widget iceCreamPhoto() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
      child: SizedBox(
        child: Image.asset(ImageConstants.instance.strawberry),
      ),
    );
  }
}
