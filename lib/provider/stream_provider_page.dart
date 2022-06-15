import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/text_widget.dart';

// StreamProvider.autoDispose: destroys state if no-longer listened
final streamProvider = StreamProvider<String>((ref) => Stream.periodic(
      const Duration(milliseconds: 400),
      (count) => '$count',
    ));

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: const Text('StreamProvider'),
        ),
        body: Center(child: buildStreamWhen(ref)),
        // Center(child: buildStreamBuilder(watch)),
      );

  Widget buildStreamWhen(WidgetRef ref) {
    final stream = ref.watch(streamProvider);

    return stream.when(
      data: (value) => TextWidget(value),
      loading: () => const CircularProgressIndicator(),
      error: (e, stack) => TextWidget('Error: $e'),
    );
  }

  // Widget buildStreamBuilder(watch) {
  //   final stream = watch(streamProvider.stream);

  //   return StreamBuilder<String>(
  //     stream: stream,
  //     builder: (context, snapshot) {
  //       switch (snapshot.connectionState) {
  //         case ConnectionState.waiting:
  //           return CircularProgressIndicator();
  //         default:
  //           if (snapshot.hasError) {
  //             return TextWidget('Error: ${snapshot.error}');
  //           } else {
  //             final counter = snapshot.data;

  //             return TextWidget(counter);
  //           }
  //       }
  //     },
  //   );
  // }
}
