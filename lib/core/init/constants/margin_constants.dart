class MarginConstants {
  static MarginConstants? _instace;
  static MarginConstants get instance => _instace ??= MarginConstants._init();

  MarginConstants._init();

  double marginMin = 5.0;
  double marginMedium = 15.0;
  double marginHigh = 25.0;
}
