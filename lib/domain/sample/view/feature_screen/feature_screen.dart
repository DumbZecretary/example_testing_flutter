import 'package:flutter/material.dart';

class SampleFeatureScreen extends StatelessWidget {
  const SampleFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: const Text(
          "Feature",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
