import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'space_time_widget.dart';
import 'neptune_screen.dart';

class MercuryScreen extends ConsumerWidget {
  const MercuryScreen({super.key});

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
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_jmljBcsQxfUzTMcz8ULvCXCCxkfj87zCgzozEhNTQw&s=10',
              width: 170,
              height: 170,
            ),
            Text(currentPlanet, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(spaceProvider.notifier).travelTo('Neptune');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NeptuneScreen(),
                  ),
                );
              },
              child: const Text('Travel to Neptune'),
            ),
          ],
        ),
      ),
    );
  }
}
