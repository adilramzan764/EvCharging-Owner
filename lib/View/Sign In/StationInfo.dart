import 'package:car_charging/View/Sign%20In/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/Assets/Assets.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Anemities_SignupWidget.dart';
import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../../Utils/Widgets/Custom Text Field/CustomTextField.dart';

class StationInfo extends StatelessWidget {
   StationInfo({Key? key}) : super(key: key);
  final List<String> anemeties=[
    'Dining',
    'Restroom',
    'Shopping',
    'Lodging',
    'Park',
    'Wifi',
    'Grocery',
    'Free Charge'
  ];

   final List<String> icons=[
     ImageAssets.dining,
     ImageAssets.restroom,
     ImageAssets.Bag,
     ImageAssets.lodging,
     ImageAssets.PARK,
     ImageAssets.wifi,
     ImageAssets.grocery,
     ImageAssets.charge,
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.38,
                width: double.infinity,
                child: Image.asset(
                  ImageAssets.signup,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.68,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: ColorValues.Gray,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Personal Information Step 2:',
                          style: TextStyle(
                              color: ColorValues.Gray,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.servicehours,
                                )),
                            hinttext: 'Service Hours',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.plug,
                                )),
                            hinttext: 'Number of charging Spots',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.price,
                                )),
                            hinttext: 'Per Hour Price',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Optional",
                                style: TextStyle(
                                    fontSize: 12, color: ColorValues.Gray),
                              )),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: CustomTextField(
                            icon: Transform.scale(
                                scale: 0.4,
                                child: SvgPicture.asset(
                                  ImageAssets.car,
                                )),
                            hinttext: 'Parking Price',
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Amenities",
                                style: TextStyle(
                                    fontSize: 12, color: ColorValues.Gray),
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.010,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 330,
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: ColorValues.LightGray,
                                  blurRadius: 2,
                                  offset: Offset(1, 2)
                              )
                            ]
                            ),
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: anemeties.length,
                              itemBuilder: (context, index) {
                                return Anemities_SignupWidget(text: anemeties[index], icon: icons[index],);
                              },
                            )
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.045,
                        ),
                        Container(
                          height: 32,
                          width: 140,
                          child: CustomButton(
                              text: 'Sign Up',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(), // Replace with your next screen widget.
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an Account?',
                              style:
                              TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  ' Sign In',
                                  style: TextStyle(
                                      color: ColorValues.Green,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
