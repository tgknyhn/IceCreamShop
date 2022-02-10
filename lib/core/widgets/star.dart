import 'package:flutter/material.dart';
import '../init/enums/star_size_enum.dart';
import '../init/theme/color_scheme.dart';

class StarImage extends StatelessWidget {
  final bool isEmpty;
  final StarSizes size;

  /// General StarImage icon to use in the app. [size] can be changed using [StarSizes] enum.
  /// [isEmpty] parameter decides if the star color will be gray or yellow.
  /// When [isEmpty] is equal to [true] then it will be grey, yellow when it is [false]
  const StarImage({Key? key, required this.isEmpty, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isEmpty ? _emptyStar() : _yellowStar();
  }

  Icon _yellowStar() {
    return Icon(
      Icons.star,
      size: _getSize(size),
      color: HomeColorScheme.instance?.starYellow,
    );
  }

  Icon _emptyStar() {
    return Icon(
      Icons.star,
      size: _getSize(size),
      color: HomeColorScheme.instance?.gray,
    );
  }

  double _getSize(StarSizes enumSize) {
    switch (enumSize) {
      case StarSizes.MIN:
        return 15.0;
      case StarSizes.MEDIUM:
        return 20.0;
      case StarSizes.MAX:
        return 25.0;
    }
  }
}
