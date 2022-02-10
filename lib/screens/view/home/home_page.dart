import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_cream_shop/screens/view/home/widgets/popular_ice_cream.dart';
import 'package:ice_cream_shop/screens/view/home/widgets/top_item.dart';
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
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        Expanded(flex: 6, child: SearchBar(height: height, width: width)),
        const Spacer(flex: 1),
        Expanded(flex: 10, child: TopFlavours(height: height, width: width, rate: 4.9, price: 14.60)),
        const Spacer(flex: 2),
        Expanded(flex: 6, child: PopularIceCream(height: height, width: width)),
        Expanded(flex: 16, child: TopItem(height: height, width: width)),
      ],
    );
  }
}