import 'package:flutter/material.dart';

class Product {
  final String name, description, subtitle;
  final Image image;
  final double price, reviewCount, score;
  final Color? lightColor, darkColor;

  /// A model class for Product. It contains all necessary information about an ice cream product.
  /// ```dart
  /// [name] Name of the product
  /// [description] Description of the product which used and showed in product_page
  /// [subtitle] Subtitle of the product which used in home_page
  /// [image] PNG image of the product
  /// [price] Price of the product
  /// [reviewCount] Shows how many reviews this product has
  /// [score] Shows rating of the product. Score must be between 0 and 5.
  /// [lightColor] Contains Color widget of the product. Light one used with cards and buttons.
  /// [darkColor] Contains Color widget of the product. Dark one used with cards.
  /// ```
  Product({
    required this.name,
    required this.description,
    required this.subtitle,
    required this.image,
    required this.price,
    required this.reviewCount,
    required this.score,
    required this.lightColor,
    required this.darkColor,
  });
}
