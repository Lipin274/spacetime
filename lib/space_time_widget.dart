import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mercury_screen.dart';

class SpaceNotifier extends Notifier<String> {
  @override
  String build() {
    return 'Earth';
  }

  void travelTo(String destination) {
    state = destination;
  }
}

final spaceProvider = NotifierProvider<SpaceNotifier, String>(
  SpaceNotifier.new,
);

class SpaceTimeWidget extends ConsumerWidget {
  const SpaceTimeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = ref.watch(spaceProvider);

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
            ClipOval(
              child: Transform.scale(
                scale:
                    1.30, // Zooms in slightly to crop off the white edges & shadow
                child: Image.network(
                  'https://png.pngtree.com/thumb_back/fh260/background/20220514/pngtree-earth-globe-europe-recycling-nature-logo-photo-image_2863349.jpg',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Text(space, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            const Text('Incoming'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref.read(spaceProvider.notifier).travelTo('Mercury');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MercuryScreen(),
                  ),
                );
              },
              child: const Text('Travel'),
            ),
          ],
        ),
      ),
    );
  }
}
