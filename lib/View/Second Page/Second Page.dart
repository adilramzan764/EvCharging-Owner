import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../Sign In/SignIn.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            width: double.infinity,
            child: Image.asset(
              ImageAssets.starter2,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: ColorValues.whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    topLeft: Radius.circular(70),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Elevate ',
                        style: TextStyle(color: ColorValues.Gray, fontSize: 18),
                      ),
                      Text(
                        'Your Business',
                        style: TextStyle(color: ColorValues.Blue, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'with EV Charging Stations',
                    style: TextStyle(color: ColorValues.Gray, fontSize: 18),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Start offering your EV charging services and\nempower the electric vehicle community.',
                      style:
                          TextStyle(color: ColorValues.LightGray, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.grey.withOpacity(0.3),
                        size: 11,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(ImageAssets.Current),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: CustomButton(
                        text: 'Next',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(), // Replace with your next screen widget.
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
