import 'package:flutter/material.dart';
import 'package:latihan_responsi_praktpm/pages/page_homepage.dart';

// Al Jauzi Abdurrohman
// Revisi Responsi Praktikum TPM IF-A

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsi',
      home: HomePage(),
    );
  }
}