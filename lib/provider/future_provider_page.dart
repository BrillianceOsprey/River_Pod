import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/text_widget.dart';

Future<String> fetchWeather() async {
  await Future.delayed(const Duration(seconds: 2));

  return 'Hello World';
}

// FutureProvider.autoDispose: destroys state if no-longer listened
final futureProvider = FutureProvider<String>((ref) => fetchWeather());

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider'),
      ),
      body: Center(
        child: future.when(
          data: (value) => TextWidget(value.toString()),
          loading: () => const CircularProgressIndicator(),
          error: (e, stack) => TextWidget('Error: $e'),
        ),
      ),
    );
  }
}
