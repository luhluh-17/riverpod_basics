import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold App'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Provider'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('State Provider'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Future Provider'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Stream Provider'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Change Notifier Provider'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('State Notifier Provider'),
          ),
        ],
      ),
    );
  }
}
