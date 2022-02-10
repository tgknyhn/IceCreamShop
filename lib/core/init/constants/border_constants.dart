/// Contains one object instance and returns radius values using that instance
class BorderConstants {
  // Creates a nullable instance
  static BorderConstants? _instace;
  // returns the instance if it is initialized or it first initializes then returns
  static BorderConstants get instance => _instace ??= BorderConstants._init();
  // Initializing the class object
  BorderConstants._init();

  // Shows how much rounding will be applied to borders.
  double circularRadiusVeryLow = 5;
  double circularRadiusLow = 10;
  double circularRadiusMedium = 15;
  double circularRadiusHigh = 20;
  double circularRadiusVeryHigh = 35;
  double circularRadiusUltraHigh = 50;
}
