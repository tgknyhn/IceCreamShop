import 'package:flutter/material.dart';
import '../../../../core/init/constants/image_constants.dart';
import '../../../../core/init/constants/padding_constants.dart';

class Greeting extends StatelessWidget {
  /// Greeting class constructor takes no parameter. It builds and returns the greeting part of the home_page
  const Greeting({Key? key}) : super(key: key);

  // Used dummy data to represent greeting part of the app
  // Since users shouldn't see and acces to these values, I made them private
  final String _userName = 'Emma';
  final String _greetingText = 'What flavor do you like to eat?';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(PaddingConstants.instance.paddingHigh),
      child: ListTile(
        title: _title(context),
        subtitle: _subtitle(context),
        trailing: _userAvatar(),
      ),
    );
  }

  Text _title(context) => Text("Hey $_userName", style: Theme.of(context).textTheme.headline6);

  Text _subtitle(context) => Text(_greetingText, style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w300));

  CircleAvatar _userAvatar() => CircleAvatar(backgroundImage: AssetImage(ImageConstants.instance.avatar1));
}
