import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_cream_shop/screens/view/home/widgets/popular_ice_cream.dart';
import 'package:ice_cream_shop/screens/view/home/widgets/top_item.dart';
import 'widgets/greeting.dart';
import 'widgets/search_bar.dart';
import 'widgets/top_flavours.dart';

class HomePage extends StatefulWidget {
  /// HomePage class constructor takes no parameter. It builds and returns the home_page
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Applies necessary features to application
    _systemFeatures();

    return Scaffold(
      resizeToAvoidBottomInset: false, // To avoid shrinking when opening virtual keyboard
      body: _homeConstrainedBox(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
    );
  }

  void _systemFeatures() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  ConstrainedBox _homeConstrainedBox(double width, double height) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: width,
        minHeight: height,
      ),
      child: IntrinsicHeight(child: _homePageWidgets(height, width)),
    );
  }

  Column _homePageWidgets(double height, double width) {
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
