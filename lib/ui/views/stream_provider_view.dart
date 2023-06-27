import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose<int>((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

// use when readings sockets, or other data that changes over time
class StreamProviderView extends ConsumerWidget {
  const StreamProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamValueProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: streamValue.when(
          data: (data) {
            return Text(
              data.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
          error: (error, stackTrace) {
            return Text('Error: $error');
          },
          loading: () {
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
