import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/widget/text_widget.dart';

final numberProvider = Provider<int>((ref) => 42);

class ProviderPage extends ConsumerWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final number = ref.watch(numberProvider).toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(child: TextWidget(number)),
    );
  }
}

// class ProviderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Provider'),
//       ),
//       body: Center(
//         child: Consumer(
//           builder: (context, watch, child) {
//             final number = watch(numberProvider).toString();

//             return TextWidget(number);
//           },
//         ),
//       ),
//     );
//   }
// }
