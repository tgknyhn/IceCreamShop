class ImageConstants {
  static ImageConstants? _instace;
  static ImageConstants get instance => _instace ??= ImageConstants._init();

  ImageConstants._init();

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
