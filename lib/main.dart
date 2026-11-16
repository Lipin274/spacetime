import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(
    const ProviderScope(
      child: SpaceTime(),
    ),
  );
}

class SpaceTime extends StatelessWidget{
  const SpaceTime({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FruitGameWidget(),
    );
  }
}