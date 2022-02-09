import 'package:flutter/material.dart';
import 'package:ice_cream_shop/core/init/constants/image_constants.dart';
import 'package:ice_cream_shop/core/init/constants/padding_constants.dart';
import 'package:ice_cream_shop/core/init/theme/color_scheme.dart';

import '../../../core/init/constants/border_constants.dart';
import '../../../core/init/constants/margin_constants.dart';

class PopularIceCream extends StatefulWidget {
  PopularIceCream({Key? key, required this.width, required this.height}) : super(key: key);

  final double width, height;

  final List<Color?> colors = [
    HomeColorScheme.instance?.strawberryDark,
    HomeColorScheme.instance?.strawberryLight,
    HomeColorScheme.instance?.vanillaDark,
    HomeColorScheme.instance?.vanillaLight,
    HomeColorScheme.instance?.caramelDark,
    HomeColorScheme.instance?.caramelLight,
  ];

  final List<Image> images = [
    Image.asset(ImageConstants.instance.strawberry),
    Image.asset(ImageConstants.instance.vanilla),
    Image.asset(ImageConstants.instance.caramel),
  ];

  final List<String> iceCreamNames = [
    "Strawberry",
    "Vanilla",
    "Caramel",
  ];

  @override
  _PopularIceCreamState createState() => _PopularIceCreamState();
}

class _PopularIceCreamState extends State<PopularIceCream> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        popularIceCreamText(context),
        iceCreamHorizontalList(context),
      ],
    );
  }

  Widget iceCreamHorizontalList(BuildContext context) {
    return Container(
      height: widget.height * 0.05,
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh, vertical: MarginConstants.instance.marginHigh),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          iceCreamCard(context: context, name: widget.iceCreamNames[0], image: widget.images[0], colorDark: widget.colors[0], colorLight: widget.colors[1]),
          SizedBox(width: widget.width * 0.03),
          iceCreamCard(context: context, name: widget.iceCreamNames[1], image: widget.images[1], colorDark: widget.colors[2], colorLight: widget.colors[3]),
          SizedBox(width: widget.width * 0.03),
          iceCreamCard(context: context, name: widget.iceCreamNames[2], image: widget.images[2], colorDark: widget.colors[4], colorLight: widget.colors[5]),
          SizedBox(width: widget.width * 0.03),
        ],
      ),
    );
  }

  Row iceCreamCard({required BuildContext context, required String name, required Image image, required Color? colorDark, required Color? colorLight}) {
    return Row(
      children: [
        iceCreamImage(image: image, color: colorDark),
        iceCreamName(context: context, color: colorLight, iceCreamName: name),
      ],
    );
  }

  Container iceCreamName({required BuildContext context, required Color? color, required String iceCreamName}) {
    return Container(
      decoration: cardDecoration(color),
      child: Padding(
        padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
        child: Center(child: Text(iceCreamName, style: Theme.of(context).textTheme.headline6)),
      ),
    );
  }

  BoxDecoration cardDecoration(Color? color) {
    return BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusVeryLow),
      color: color,
    );
  }

  Container iceCreamImage({required Image image, required Color? color}) {
    return Container(
      decoration: cardDecoration(color),
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMin),
      child: image,
    );
  }

  Widget popularIceCreamText(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text("Popular Ice Cream", style: Theme.of(context).textTheme.headline6),
    );
  }
}
