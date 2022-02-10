/// Contains one object instance and returns button sizes using that instance
class PaddingConstants {
  // Creates a nullable instance
  static PaddingConstants? _instace;
  // returns the instance if it is initialized or it first initializes then returns
  static PaddingConstants get instance => _instace ??= PaddingConstants._init();
  // Initializing the class object
  PaddingConstants._init();

  // Shows how big buttons are going to be.
  double paddingMin = 5.0;
  double paddingMedium = 10.0;
  double paddingHigh = 15.0;
  double paddingVeryHigh = 30.0;
  double paddingUltraHigh = 45.0;
}
