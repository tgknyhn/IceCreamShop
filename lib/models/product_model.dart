import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final String name, description, subtitle;
  final Image image;
  final double price, reviewCount, score;
  final Color? lightColor, darkColor;

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
