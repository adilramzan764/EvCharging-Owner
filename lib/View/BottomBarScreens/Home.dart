import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:car_charging/Utils/Color/Color.dart';
import 'package:car_charging/Utils/Widgets/CutomWidgets.dart';
import 'package:car_charging/View/Notifications/Notification_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/Widgets/Bookings_Widget.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);


   final List<String> port_types=[
     'Charging Port CSI!-Dc',
     'Charging Port Type 2',
     'Charging Port GB/T',
     'Charging Port Ac -type 2'
   ];
   final List<String> free_or_reserved=[
     'Free',
     'Reserved',
     'Free',
     'Reserved',
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorValues.Blue,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      children: [
                        CircularImage(ImageAssets.model, 35, 35),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Welcome back!',
                              style: TextStyle(
                                  color: ColorValues.whiteColor, fontSize: 15),
                            ),
                            Text(
                              'Have a nice day',
                              style: TextStyle(
                                  color: ColorValues.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: CircularButtons(
                              ImageAssets.notification, () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Notification_Screen(), // Replace with your next screen widget.
                              ),
                            );
                          }, 30, 30),
                        ))
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.13,
                    left: 25,
                    right: 25),
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: ColorValues.whiteColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: ColorValues.LightGray,
                            blurRadius: 2,
                            offset: Offset(1, 2))
                      ]),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Earning',
                            style: TextStyle(
                                color: ColorValues.blackColor, fontSize: 11),
                          ),
                          Text(
                            '2564 SR',
                            style: TextStyle(
                                color: ColorValues.blackColor, fontSize: 18),
                          ),
                        ],
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.centerRight,
                        child: Transform.scale(
                            scale: 1.4,
                            child: SvgPicture.asset(ImageAssets.earning)),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Station',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    height: (120*port_types.length.toDouble())/2,
                  
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      itemCount:  4/* Set your item count */,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:   2/* Set your desired cross axis count */,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 3),
                  
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return           Container(
                          height: 90,
                          // width: 150,
                          decoration: BoxDecoration(
                              color: ColorValues.whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: ColorValues.LightGray,
                                    blurRadius: 2,
                                    offset: Offset(1, 2))
                              ]),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: MediaQuery.of(context).size.width* 0.2,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15)) ,
                                      color: ColorValues.Green
                                  ),
                                  child: Center(
                                    child: Text(
                                      free_or_reserved[index],
                                      style: TextStyle(color: ColorValues.whiteColor ,fontSize:  12),
                                    ),
                                  ),
                    
                                ),
                              ),
                              SizedBox(height: 5,),
                              SvgPicture.asset(ImageAssets.plug,color: ColorValues.Blue,height: 50,width: 50,),
                              SizedBox(height: 5,),
                              Text(port_types[index],style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        )
                        ;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent Booking Slots',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Bookings_Widget(isupcoming: true, iscompleted: false, iscancelled: false,),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Bookings_Widget(isupcoming: true, iscompleted: false, iscancelled: false,),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.1,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
