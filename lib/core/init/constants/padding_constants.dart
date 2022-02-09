class PaddingConstants {
  static PaddingConstants? _instace;
  static PaddingConstants get instance => _instace ??= PaddingConstants._init();

  PaddingConstants._init();

  double paddingMin = 5.0;
  double paddingMedium = 10.0;
  double paddingHigh = 15.0;
}
