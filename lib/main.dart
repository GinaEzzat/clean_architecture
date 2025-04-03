import 'package:flutter/material.dart';
import 'core/services/injection.dart';
import 'features/main_user_screen/presentation/pages/product_page.dart';


void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FakeStore Products',
      home: ProductPage(),
    );
  }
}
