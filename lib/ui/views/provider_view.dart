import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final valueProvider = Provider<int>((ref) => 42);

// Basic Provider is for Readonly data
class ProviderView extends StatelessWidget {
  const ProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final value = ref.watch(valueProvider);
            return Text(
              value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ),
    );
  }
}

// Second Example using ConsumerWidget
class ProviderView2 extends ConsumerWidget {
  const ProviderView2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(
        child: Text(
          value.toString(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
