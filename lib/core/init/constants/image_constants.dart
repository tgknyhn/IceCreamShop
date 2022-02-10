/// Contains one object instance and returns dollar sign sizes using that instance
class ImageConstants {
  // Creates a nullable instance
  static ImageConstants? _instace;
  // returns the instance if it is initialized or it first initializes then returns
  static ImageConstants get instance => _instace ??= ImageConstants._init();
  // Initializing the class object
  ImageConstants._init();

  // Use them like for ex: 'Image.asset(ImageConstants.instance.avatar1)'

  // Avatar Constants
  String avatar1 = "assets/avatars/avatar_1.png";
  // Icon Constants
  String filterIcon = "assets/icons/filter.png";
  // Ice Cream Constants
  String caramel = "assets/ice-creams/caramel.png";
  String strawberry = "assets/ice-creams/strawberry.png";
  String vanilla = "assets/ice-creams/vanilla.png";
  String item1 = "assets/ice-creams/item_1.png";
  String item2 = "assets/ice-creams/item_2.png";
}
