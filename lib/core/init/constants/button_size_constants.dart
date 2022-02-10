/// Contains one object instance and returns button sizes using that instance
class ButtonSizeConstants {
  // Creates a nullable instance
  static ButtonSizeConstants? _instace;
  // returns the instance if it is initialized or it first initializes then returns
  static ButtonSizeConstants get instance => _instace ??= ButtonSizeConstants._init();
  // Initializing the class object
  ButtonSizeConstants._init();

  // Shows how much padding is going to be applied to widgets
  double min = 10;
  double medium = 15;
  double max = 20;
}
