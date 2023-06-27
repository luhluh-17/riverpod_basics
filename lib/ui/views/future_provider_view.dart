import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/suggestion.dart';
import '../services/api_service.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose.family<Suggestion?, String>(
  (ref, id) async {
    final apiService = ref.watch(apiServiceProvider);
    return apiService.fetchSuggestion(id);
  },
);

class FutureProviderView extends ConsumerWidget {
  const FutureProviderView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider('1'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider('1').future),
        child: ListView(
          children: [
            suggestionRef.when(
              data: (data) {
                if (data == null) {
                  return const Text('No Data');
                }
                return Text(
                  data.activity,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text(error.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
