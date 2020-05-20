import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery UI',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
        primaryColor: Colors.deepOrangeAccent,
      ),
      home: HomePage(),
    );
  }
}
