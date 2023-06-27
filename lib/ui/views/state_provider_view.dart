import 'package:flutter/material.dart';

class StateProviderView extends StatelessWidget {
  const StateProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: const Placeholder(),
    );
  }
}
