import './screens/products_overview_screen.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsOverviewScreen(),
    );
  }
}
