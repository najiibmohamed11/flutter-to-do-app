import 'package:flutter/material.dart';
import 'package:to_do_list_app/screens/Home.dart';
import 'package:to_do_list_app/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SignUp(),
    );
  }
}
