/// Contains one object instance and returns button sizes using that instance
class MarginConstants {
  // Creates a nullable instance
  static MarginConstants? _instace;
  // returns the instance if it is initialized or it first initializes then returns
  static MarginConstants get instance => _instace ??= MarginConstants._init();
  // Initializing the class object
  MarginConstants._init();

  // Shows how much margin is going to be applied to widgets
  double marginMin = 5.0;
  double marginMedium = 15.0;
  double marginHigh = 25.0;
}
