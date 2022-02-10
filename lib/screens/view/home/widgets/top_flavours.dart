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
  /// TopFlavours class constructor takes four parameter.
  /// [width] holds the width value of the device
  /// [height] holds the heigth value of the device
  /// [rate] Rate of the Top Flavour
  /// [price] Price of the Top Flavour
  const TopFlavours({Key? key, required this.width, required this.height, required this.rate, required this.price}) : super(key: key);

  final double width, height;
  final double rate, price, reviewCount = 230;
  final String _title = "Vanilla Ice Cream";

  @override
  _TopFlavoursState createState() => _TopFlavoursState();
}

class _TopFlavoursState extends State<TopFlavours> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _topFlavoursText()),
        Expanded(flex: 5, child: _iceCreamCard()),
      ],
    );
  }

  Widget _topFlavoursText() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text("Top Flavours", style: Theme.of(context).textTheme.headline6),
    );
  }

  Card _iceCreamCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusMedium)),
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      color: HomeColorScheme.instance?.vanillaDark,
      child: Row(
        children: [
          Expanded(flex: 1, child: _iceCreamPhoto()),
          Expanded(flex: 1, child: _iceCreamInfo()),
        ],
      ),
    );
  }

  Widget _iceCreamPhoto() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingHigh),
      child: SizedBox(
        child: Image.asset(ImageConstants.instance.vanilla),
      ),
    );
  }

  Widget _iceCreamInfo() {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Expanded(flex: 2, child: _iceCreamName()),
          Expanded(flex: 3, child: _amountAndRateRow()),
          Expanded(flex: 3, child: _priceAndButtonRow()),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Text _iceCreamName() => Text(widget._title, style: Theme.of(context).textTheme.headline6);

  Row _amountAndRateRow() {
    return Row(
      children: [
        Expanded(flex: 2, child: _iceCreamAmount()),
        const Spacer(flex: 1),
        Expanded(flex: 2, child: _iceCreamRate()),
        const Spacer(flex: 1),
      ],
    );
  }

  Widget _iceCreamAmount() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: PaddingConstants.instance.paddingMin),
      decoration: _amountDecoration(),
      child: Center(child: Text("1 KG", style: Theme.of(context).textTheme.subtitle2), heightFactor: 1),
    );
  }

  BoxDecoration _amountDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusLow),
      color: HomeColorScheme.instance?.yellow,
    );
  }

  Widget _iceCreamRate() {
    return Row(
      children: [
        const Expanded(flex: 1, child: StarImage(isEmpty: false, size: StarSizes.MIN)),
        Expanded(flex: 1, child: _rateValue()),
      ],
    );
  }

  Text _rateValue() {
    return Text(
      widget.rate.toStringAsFixed(1),
      style: Theme.of(context).textTheme.subtitle2,
    );
  }

  Row _priceAndButtonRow() {
    return Row(
      children: [
        DollarSign(size: DollarSizeConstants.instance.sizeMedium),
        _priceText(),
        const Spacer(flex: 2),
        AddButton(size: ButtonSizeConstants.instance.max, productName: 'Vanilla'),
        const Spacer(flex: 1),
      ],
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  Text _priceText() {
    return Text(widget.price.toStringAsFixed(2), style: Theme.of(context).textTheme.headline6);
  }
}
