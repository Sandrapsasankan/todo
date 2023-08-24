import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo/grocery.dart';
import 'package:todo/provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Provider_class(),
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Grocery(),
    ),
  ));
}