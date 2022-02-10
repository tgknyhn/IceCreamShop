import 'package:flutter/material.dart';
import 'package:ice_cream_shop/screens/view_model/product_view_model.dart';
import '../../../../core/init/constants/border_constants.dart';
import '../../../../core/init/constants/image_constants.dart';
import '../../../../core/init/constants/margin_constants.dart';
import '../../../../core/init/constants/padding_constants.dart';
import '../../../../core/init/theme/color_scheme.dart';

class PopularIceCream extends StatefulWidget {
  final double width, height;

  /// PopularIceCream class constructor takes two parameter.
  /// [width] holds the width value of the device
  /// [height] holds the heigth value of the device
  PopularIceCream({Key? key, required this.width, required this.height}) : super(key: key);

  // Since I used dummy data to represent popular_ice_Cream part of the home_page I initialized the dummy datas here
  // Also made them private since they shouldn't be seen by the user.
  final List<Color?> _colors = [
    HomeColorScheme.instance?.strawberryDark,
    HomeColorScheme.instance?.strawberryLight,
    HomeColorScheme.instance?.vanillaDark,
    HomeColorScheme.instance?.vanillaLight,
    HomeColorScheme.instance?.caramelDark,
    HomeColorScheme.instance?.caramelLight,
  ];

  final List<Image> _images = [
    Image.asset(ImageConstants.instance.strawberry),
    Image.asset(ImageConstants.instance.vanilla),
    Image.asset(ImageConstants.instance.caramel),
  ];

  final List<String> _iceCreamNames = [
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _popularIceCreamText(context),
        _iceCreamHorizontalList(context),
      ],
    );
  }

  Widget _iceCreamHorizontalList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh, vertical: MarginConstants.instance.marginMedium),
      height: widget.height * 0.05,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _iceCreamCard(context: context, name: widget._iceCreamNames[0], image: widget._images[0], colorDark: widget._colors[0], colorLight: widget._colors[1]),
          SizedBox(width: widget.width * 0.03), // Used for spacing between cards
          _iceCreamCard(context: context, name: widget._iceCreamNames[1], image: widget._images[1], colorDark: widget._colors[2], colorLight: widget._colors[3]),
          SizedBox(width: widget.width * 0.03), // Used for spacing between cards
          _iceCreamCard(context: context, name: widget._iceCreamNames[2], image: widget._images[2], colorDark: widget._colors[4], colorLight: widget._colors[5]),
        ],
      ),
    );
  }

  Widget _iceCreamCard({required BuildContext context, required String name, required Image image, required Color? colorDark, required Color? colorLight}) {
    return InkWell(
      onTap: () => ProductViewModel.instance.goToProductPage(context: context, productName: name),
      child: Row(
        children: [
          _iceCreamImage(image: image, color: colorDark),
          _iceCreamName(context: context, color: colorLight, iceCreamName: name),
        ],
      ),
    );
  }

  Container _iceCreamName({required BuildContext context, required Color? color, required String iceCreamName}) {
    return Container(
      decoration: _cardDecoration(color),
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(PaddingConstants.instance.paddingMedium),
        child: Text(
          iceCreamName,
          style: Theme.of(context).textTheme.headline6,
          textScaleFactor: 0.6,
        ),
      )),
    );
  }

  BoxDecoration _cardDecoration(Color? color) {
    return BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusVeryLow),
      color: color,
    );
  }

  Container _iceCreamImage({required Image image, required Color? color}) {
    return Container(
      decoration: _cardDecoration(color),
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMin),
      child: image,
    );
  }

  Widget _popularIceCreamText(context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MarginConstants.instance.marginHigh),
      child: Text("Popular Ice Cream", style: Theme.of(context).textTheme.headline6),
    );
  }
}
