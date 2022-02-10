import 'package:flutter/material.dart';
import '../init/theme/color_scheme.dart';

/// The dollar sign icon used in the app. Size of the icon can be changed using required parameter [size]
/// Best way to use size parameter is using DollarSizeConstants instance since it lets us write much cleaner codes.
class DollarSign extends StatelessWidget {
  const DollarSign({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.attach_money,
      color: HomeColorScheme.instance?.pink,
      size: size,
    );
  }
}
