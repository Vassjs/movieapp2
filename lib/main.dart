import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 1726,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const Alignment(0.07, -1.00),
              end: const Alignment(-0.07, 1),
              colors: [Colors.white.withOpacity(0.00009999999747378752), Colors.white]
          )
      ),
      child: Container(

      ),
    );
  }
}