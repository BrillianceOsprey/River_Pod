import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider.autoDispose: destroys state if no-longer listened
final stateProvider = StateProvider<int>((ref) => 0);

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);
    final counter = provider.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(child: Text(counter.toString())),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // provider.state++;
          // final provider = context.read(stateProvider);
          increment(ref);
        },
      ),
    );
  }

  void increment(WidgetRef ref) {
    ref.read(stateProvider.notifier).state++;
  }
}
