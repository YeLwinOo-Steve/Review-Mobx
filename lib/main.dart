import 'package:flutter/material.dart';

import 'screens/review.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Review mobx',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Review(),
    );
  }
}
