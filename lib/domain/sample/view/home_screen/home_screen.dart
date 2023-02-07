import 'package:flutter/material.dart';

import 'components/custom_component.dart';

class SampleHomeScreen extends StatelessWidget {
  const SampleHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade800,
      body: const HomeScreenCustomComponent(),
    );
  }
}
