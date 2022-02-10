import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/view/home/home_page.dart';

void main() async {
  await firebaseInitialization();
  runApp(const MyApp());
}

Future<void> firebaseInitialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
