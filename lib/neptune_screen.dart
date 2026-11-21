import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'space_time_widget.dart';

class NeptuneScreen extends ConsumerWidget {
  const NeptuneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlanet = ref.watch(spaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SpaceTime'),
        backgroundColor: Color(0xFF0A0A0F),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/2/20/Neptune_cutout.png',
              width: 170,
              height: 170,
            ),

            Text(currentPlanet, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(spaceProvider.notifier).travelTo('Earth');
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Return to Earth'),
            ),
          ],
        ),
      ),
    );
  }
}
