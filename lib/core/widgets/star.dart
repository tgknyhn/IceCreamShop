import 'package:flutter/material.dart';
import '../init/enums/star_size_enum.dart';
import '../init/theme/color_scheme.dart';

class StarImage extends StatelessWidget {
  final bool isEmpty;
  final StarSizes size;
  const StarImage({Key? key, required this.isEmpty, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isEmpty ? emptyStar() : yellowStar();
  }

  Icon yellowStar() {
    return Icon(
      Icons.star,
      size: getSize(size),
      color: HomeColorScheme.instance?.starYellow,
    );
  }

  Icon emptyStar() {
    return Icon(
      Icons.star,
      size: getSize(size),
      color: HomeColorScheme.instance?.gray,
    );
  }

  double getSize(StarSizes enumSize) {
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
