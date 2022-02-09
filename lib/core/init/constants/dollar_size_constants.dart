class DollarSizeConstants {
  static DollarSizeConstants? _instace;
  static DollarSizeConstants get instance => _instace ??= DollarSizeConstants._init();

  DollarSizeConstants._init();

  double sizeMin = 10.0;
  double sizeMedium = 20.0;
  double sizeMax = 30.0;
}
