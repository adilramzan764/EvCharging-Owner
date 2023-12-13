import 'dart:ui';

import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:flutter/material.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width ,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageAssets.map),fit: BoxFit.cover)
            ),

          ),
          Container(
            height: MediaQuery.of(context).size.height ,
            width: MediaQuery.of(context).size.width ,
            color: Colors.black.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                )
                ,
              ),
            ),

          ),
        ],
      ),
    );
  }
}
