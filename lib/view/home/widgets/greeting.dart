import 'package:flutter/material.dart';
import '../../../core/init/constants/image_constants.dart';
import '../../../core/init/constants/padding_constants.dart';

class Greeting extends StatelessWidget {
  const Greeting({Key? key}) : super(key: key);

  final String userName = 'Emma';
  final String greetingText = 'What flavor do you like to eat?';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingHigh),
      child: ListTile(
        title: title(context),
        subtitle: subtitle(context),
        trailing: userAvatar(),
      ),
    );
  }

  Text title(context) {
    return Text(
      "Hey $userName",
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Text subtitle(context) {
    return Text(
      greetingText,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w300),
    );
  }

  CircleAvatar userAvatar() {
    return CircleAvatar(backgroundImage: AssetImage(ImageConstants.instance.avatar1));
  }
}
