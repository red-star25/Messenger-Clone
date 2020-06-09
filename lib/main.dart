import 'package:flutter/material.dart';
import 'package:messenger/Screens/Messenger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Messenger_Home(),
    );
  }
}