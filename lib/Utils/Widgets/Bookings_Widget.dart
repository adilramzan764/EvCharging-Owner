import 'package:car_charging/Model/OrderModel.dart';
import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../CallHandler.dart';
import '../Color/Color.dart';
import 'Custom Button/Custom Button.dart';


class Bookings_Widget extends StatefulWidget {
  bool isupcoming;  bool iscompleted;   bool iscancelled;OrderModel? order;



  Bookings_Widget({Key? key,required this.isupcoming, required this.iscompleted,required this.iscancelled,this.order}) : super(key: key);

  @override
  State<Bookings_Widget> createState() => _Bookings_WidgetState();
}

class _Bookings_WidgetState extends State<Bookings_Widget> {
  bool isavailable = true;

   bool switchValue = false;

   @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.37,
          width: double.infinity,
          padding: widget.iscompleted ?EdgeInsets.all(8) : EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1
              ),

            ],),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),


                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: ColorValues.LightGray.withOpacity(0.5),
                              blurRadius: 1,
                            spreadRadius: 1
                          ),
                        ],
                          ),
                      child: Transform.scale(
                          scale: 0.6,
                          child: SvgPicture.asset(ImageAssets.teslacar)),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.order!.carName,
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          widget.order!.chargerType,
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.7), fontSize: 10),
                        ),
                        SizedBox(
                          height: 3,
                        ),
        SvgPicture.asset(ImageAssets.plug1,height: 15,width: 15,)                  ],
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: (){
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => Navigation(), // Replace with your next screen widget.
                              //   ),
                              // );
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: ColorValues.Blue, shape: BoxShape.circle),
                              child: Center(
                                child: SvgPicture.asset('assets/directions.svg'),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.01,
                ),
        Divider(color: Colors.grey.withOpacity(0.5),thickness: 1,),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.order!.buyerName,
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                        Text(
                          widget.order!.buyerPhone,
                          style: TextStyle(color: widget.isupcoming ? Colors.black :Colors.grey.withOpacity(0.6), fontSize: 11),
                        ),
                        Text(
                          ' ${widget.order!.startedAt}',
                          style: TextStyle(color: widget.isupcoming ? Colors.black :Colors.grey.withOpacity(0.6), fontSize: 11),
                        ),
                      ],
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.21,
                      child: CustomButton(text: 'Call', onPressed: () {
                        CallHandler.makePhoneCall(widget.order!.buyerPhone);
                      },

                      ),

                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.01,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  color: ColorValues.lightblue.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              ' ${widget.order!.duration} hours',
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Charging Hours',
                              style: TextStyle(
                                  fontSize: 11, color: ColorValues.Blue),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        VerticalDivider(
                          color: Colors.grey.withOpacity(0.5),
                          thickness: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '\$ ${widget.order!.chargingPrice}',
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Charging Price',
                              style: TextStyle(
                                  fontSize: 11, color: ColorValues.Blue),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        VerticalDivider(
                          color: Colors.grey.withOpacity(0.5),
                          thickness: 1,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.01,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "\$ ${widget.order!.parkingPrice}",
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              'Parking fee',
                              style: TextStyle(
                                  fontSize: 11, color: ColorValues.Blue),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
if(widget.iscancelled)
        Container(
          height: MediaQuery.of(context).size.height * 0.37,
          width: double.infinity,
          padding: widget.iscompleted ?EdgeInsets.all(8) : EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color(0xffDADAD9).withOpacity(0.1), borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1
              ),

            ],),

        ),

      ],
    );
  }
}
