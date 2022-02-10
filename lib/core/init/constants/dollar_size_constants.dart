/// Contains one object instance and returns dollar sign sizes using that instance
class DollarSizeConstants {
  // Creates a nullable instance
  static DollarSizeConstants? _instace;
  // returns the instance if it is initialized or it first initializes then returns
  static DollarSizeConstants get instance => _instace ??= DollarSizeConstants._init();
  // Initializing the class object
  DollarSizeConstants._init();

  // Shows how big dollar signs are going to be.
  double sizeMin = 10.0;
  double sizeMedium = 20.0;
  double sizeMax = 30.0;
}
