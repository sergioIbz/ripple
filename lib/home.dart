import 'package:flutter/material.dart';
import 'package:ripple/ripple.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Ripple(
          widget: Image.network(
            'https://i.pinimg.com/originals/5f/2e/8b/5f2e8bb9837ac966fe4346387082d346.png',
            width: 300,
          ),
        ),
      ),
    );
  }
}
