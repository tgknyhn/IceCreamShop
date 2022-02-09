import 'package:flutter/material.dart';
import '../init/constants/button_size_constants.dart';
import '../init/theme/color_scheme.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundColor: HomeColorScheme.instance?.pink,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.add),
        iconSize: size,
      ),
    );
  }
}
