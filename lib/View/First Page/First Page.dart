import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Utils/Assets/Assets.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Custom Button/Custom Button.dart';
import '../Second Page/Second Page.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            width: double.infinity,
            child: Image.asset(
              ImageAssets.starter1,
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
                  Text(
                    'Embrace EV Charging',
                    style: TextStyle(color: ColorValues.Gray, fontSize: 18),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'and Supercharge',
                        style: TextStyle(color: ColorValues.Gray, fontSize: 18),
                      ),
                      Text(
                        ' Your Earnings',
                        style:
                            TextStyle(color: ColorValues.Blue, fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'Be a part of the sustainable future,\nand let your charging stations make a difference.',
                      style: TextStyle(
                          color: ColorValues.LightGray, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(ImageAssets.Current),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.grey.withOpacity(0.3),
                        size: 11,
                      )
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
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) {
                                return SecondPage();
                              },
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(1.0, 0.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
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
