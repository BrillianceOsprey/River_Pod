import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/text_widget.dart';

final cityProvider = Provider<String>((ref) => 'Munich2');

Future<int> fetchWeather(String city) async {
  await Future.delayed(Duration(seconds: 2));

  return city == 'Munich2' ? 20 : 15;
}

final futureProvider = FutureProvider<int>((ref) async {
  final city = ref.watch(cityProvider);

  return fetchWeather(city);
});

class CombinedProvidersPage extends ConsumerWidget {
  const CombinedProvidersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.watch(futureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Combining Providers'),
      ),
      body: Center(
        child: future.when(
          data: (value) => TextWidget(value.toString()),
          loading: () => CircularProgressIndicator(),
          error: (e, stack) => TextWidget('Error: $e'),
        ),
      ),
    );
  }
}
