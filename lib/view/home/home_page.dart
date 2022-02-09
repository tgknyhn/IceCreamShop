import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_cream_shop/view/home/widgets/popular_ice_cream.dart';
import 'package:ice_cream_shop/view/home/widgets/top_item.dart';
import 'widgets/greeting.dart';
import 'widgets/search_bar.dart';
import 'widgets/top_flavours.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: homeConstrainedBox(width, height),
    );
  }

  ConstrainedBox homeConstrainedBox(double width, double height) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: width,
        minHeight: height,
      ),
      child: IntrinsicHeight(
        child: homePageWidgets(height, width),
      ),
    );
  }

  Column homePageWidgets(double height, double width) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex: 4, child: Greeting()),
        Expanded(flex: 5, child: SearchBar(height: height, width: width)),
        Expanded(flex: 10, child: TopFlavours(height: height, width: width, rate: 4.9, price: 14.60)),
        Spacer(flex: 1),
        Expanded(flex: 6, child: PopularIceCream(height: height, width: width)),
        Expanded(flex: 16, child: TopItem(height: height, width: width)),
      ],
    );
  }
}
