class ButtonSizeConstants {
  static ButtonSizeConstants? _instace;
  static ButtonSizeConstants get instance => _instace ??= ButtonSizeConstants._init();

  ButtonSizeConstants._init();

  double min = 10;
  double medium = 15;
  double max = 20;
}
