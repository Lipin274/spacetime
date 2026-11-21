import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'space_time_widget.dart';

void main() {
  runApp(const ProviderScope(child: SpaceTime()));
}

class SpaceTime extends StatelessWidget {
  const SpaceTime({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpaceTimeWidget(),
    );
  }
}
