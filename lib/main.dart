import 'package:e_com_app/Home.dart';
import 'package:e_com_app/utils/Global.dart';
import 'package:e_com_app/utils/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'DeatilPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const home_page(),
        'second': (context) => const detail_page(),
        'third': (context) => const cart_page(),
      },
    ),
  );
}
