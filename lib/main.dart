import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF31313C),
          scaffoldBackgroundColor: Color(0xFF31313C)),
      home: PriceScreen(),
    );
  }
}
