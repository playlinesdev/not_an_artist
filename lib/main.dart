import 'package:flutter/material.dart';
import 'package:not_an_artist/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(NAAApp());
}

class NAAApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
