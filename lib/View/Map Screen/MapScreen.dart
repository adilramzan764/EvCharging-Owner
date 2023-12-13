import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:flutter/material.dart';


class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Stack(
            children: [
              Image.asset(ImageAssets.PersonCharger)
            ],
          )
        ],
      ),
    );
  }
}
