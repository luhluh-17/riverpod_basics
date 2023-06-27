import 'package:flutter/material.dart';

class ChangeNotifierProviderView extends StatelessWidget {
  const ChangeNotifierProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider'),
      ),
      body: const Placeholder(),
    );
  }
}
