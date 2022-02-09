import 'package:flutter/material.dart';

class HomeColorScheme {
  static HomeColorScheme? _instace;
  static HomeColorScheme? get instance {
    _instace ??= HomeColorScheme._init();
    return _instace;
  }

  HomeColorScheme._init();

  final Color pingkLight = const Color(0xFFfedadc);
  final Color pink = const Color(0xFFfc448c);
  final Color gray = const Color(0xFFf3f3f3);
  final Color white = const Color(0xFFFFFFFF);
  final Color yellow = const Color(0xFFFFF091);
  final Color blueLight = const Color(0xFFdef4ff);

  // Ice Cream Colors
  final Color strawberryDark = const Color(0xFFFB5392);
  final Color strawberryLight = const Color(0xFFFEDADC);

  final Color vanillaDark = const Color(0xFFFFDA8D);
  final Color vanillaLight = const Color(0xFFffeeca);

  final Color caramelDark = const Color(0xFFb2bff8);
  final Color caramelLight = const Color(0xFFd3ddff);
}
