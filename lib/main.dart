import 'package:flutter/material.dart';
import 'package:flutter_lab/screen/band_home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.white,
          ),
        ),
        cardColor: Colors.black,
      ),
      home: const BandHomeScreen(),
    );
  }
}
