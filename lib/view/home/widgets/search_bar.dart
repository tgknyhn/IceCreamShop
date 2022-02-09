import 'package:flutter/material.dart';
import 'package:ice_cream_shop/core/init/constants/padding_constants.dart';
import '../../../core/init/constants/border_constants.dart';
import '../../../core/init/constants/image_constants.dart';
import '../../../core/init/constants/margin_constants.dart';
import '../../../core/init/theme/color_scheme.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.width, required this.height}) : super(key: key);

  final double width, height;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MarginConstants.instance.marginHigh),
      decoration: containerDecoration(),
      child: searchRow(context),
    );
  }

  BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: HomeColorScheme.instance?.gray,
      borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusLow),
    );
  }

  Row searchRow(context) {
    return Row(
      children: [
        Expanded(flex: 2, child: searchIcon()),
        Expanded(flex: 6, child: searchTextField()),
        const Spacer(flex: 1),
        Expanded(flex: 4, child: filterButton(context)),
      ],
    );
  }

  TextField searchTextField() {
    return const TextField(decoration: InputDecoration(border: InputBorder.none, hintText: "Search"));
  }

  Widget filterButton(context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMin),
      child: TextButton(
        style: filterButtonStyle(),
        child: Row(
          children: [
            const Spacer(),
            filterIcon(),
            const Spacer(),
            filterButtonText(),
            const Spacer(),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  Text filterButtonText() {
    return Text(
      "Filter",
      style: TextStyle(color: HomeColorScheme.instance?.white),
      overflow: TextOverflow.ellipsis,
    );
  }

  ButtonStyle filterButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(HomeColorScheme.instance?.pink),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BorderConstants.instance.circularRadiusMedium),
      )),
    );
  }

  Widget filterIcon() {
    return SizedBox(
      child: Image.asset(ImageConstants.instance.filterIcon),
    );
  }

  Icon searchIcon() => const Icon(Icons.search);
}
