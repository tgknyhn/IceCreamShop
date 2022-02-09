import 'package:flutter/material.dart';

import '../init/theme/color_scheme.dart';

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
