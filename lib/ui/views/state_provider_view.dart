import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// user autoDispose to dispose of the state when no longer needed
final valueStateProvider = StateProvider.autoDispose<int>((ref) => 0);

// final valueStateProvider = StateProvider<int>((ref) => 42);

class StateProviderView extends ConsumerWidget {
  const StateProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);

    // Listen to the state changes
    ref.listen<int>(
      valueStateProvider,
      (previous, current) {
        if (current == 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Value changed from $previous to $current'),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(valueStateProvider.notifier).state++;
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                ref.invalidate(valueStateProvider);
              },
              child: const Text('Invalidate'),
            ),
          ],
        ),
      ),
    );
  }
}
