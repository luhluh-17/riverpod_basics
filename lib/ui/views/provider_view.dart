import 'package:flutter/material.dart';

class ProviderView extends StatelessWidget {
  const ProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: const Placeholder(),
    );
  }
}
