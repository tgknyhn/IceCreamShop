import 'package:flutter/material.dart';
import '../../../../core/init/constants/border_constants.dart';
import '../../../../core/init/constants/image_constants.dart';
import '../../../../core/init/constants/margin_constants.dart';
import '../../../../core/init/constants/padding_constants.dart';
import '../../../../core/init/theme/color_scheme.dart';

class SearchBar extends StatefulWidget {
  final double width, height;

  /// SearchBar class constructor takes two parameter.
  /// [width] holds the width value of the device
  /// [height] holds the heigth value of the device
  const SearchBar({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(MarginConstants.instance.marginHigh),
      decoration: _containerDecoration(),
      child: _searchRow(context),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: HomeColorScheme.instance?.gray,
      borderRadius: BorderRadiusDirectional.circular(BorderConstants.instance.circularRadiusLow),
    );
  }

  Row _searchRow(context) {
    return Row(
      children: [
        Expanded(flex: 2, child: _searchIcon()),
        Expanded(flex: 6, child: _searchTextField()),
        const Spacer(flex: 1),
        Expanded(flex: 4, child: _filterButton(context)),
      ],
    );
  }

  Icon _searchIcon() => const Icon(Icons.search);

  TextField _searchTextField() => const TextField(decoration: InputDecoration(border: InputBorder.none, hintText: "Search"));

  Widget _filterButton(context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingMin),
      child: TextButton(
        style: _filterButtonStyle(),
        child: _filterButtonRow(),
        onPressed: () {},
      ),
    );
  }

  ButtonStyle _filterButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(HomeColorScheme.instance?.pink),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(BorderConstants.instance.circularRadiusMedium))),
    );
  }

  Row _filterButtonRow() {
    return Row(
      children: [
        const Spacer(),
        _filterIcon(),
        const Spacer(),
        _filterButtonText(),
        const Spacer(),
      ],
    );
  }

  Widget _filterIcon() {
    return SizedBox(
      child: Image.asset(ImageConstants.instance.filterIcon),
    );
  }

  Text _filterButtonText() {
    return Text(
      "Filter",
      style: TextStyle(color: HomeColorScheme.instance?.white),
      overflow: TextOverflow.ellipsis,
    );
  }
}
