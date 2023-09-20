import 'package:e_com_app/Home.dart';
import 'package:e_com_app/utils/cart.dart';
import 'package:flutter/material.dart';

import 'DeatilPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const home_page(),
        'second': (context) => const DetailPage(),
        'third': (context) => const cart_page(),
      },
    ),
  );
}
