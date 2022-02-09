class BorderConstants {
  static BorderConstants? _instace;
  static BorderConstants get instance => _instace ??= BorderConstants._init();

  BorderConstants._init();

  double circularRadiusVeryLow = 5;
  double circularRadiusLow = 10;
  double circularRadiusMedium = 15;
  double circularRadiusHigh = 20;
}
