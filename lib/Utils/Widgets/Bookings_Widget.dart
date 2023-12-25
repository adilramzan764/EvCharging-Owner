import 'package:car_charging/Model/OrderModel.dart';
import 'package:car_charging/Utils/Assets/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Color/Color.dart';
import 'Custom Button/Custom Button.dart';


class Bookings_Widget extends StatefulWidget {
  bool isupcoming;  bool iscompleted;   bool iscancelled;BookingInfo? order;

int? index;

  Bookings_Widget({Key? key,required this.isupcoming, this.index, required this.iscompleted,required this.iscancelled,this.order}) : super(key: key);

  @override
  State<Bookings_Widget> createState() => _Bookings_WidgetState();
}

class _Bookings_WidgetState extends State<Bookings_Widget> {
  bool isavailable = true;

   bool switchValue = false;

   @override
  Widget build(BuildContext context) {
     final BookingInfo orderData = widget.order!;

     return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.37,
          width: double.infinity,
          padding: widget.iscompleted ?const EdgeInsets.all(8) : const EdgeInsets.all(2),
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
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          orderData.carName + widget.index.toString(),
                          style: const TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          orderData.chargerType,
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.7), fontSize: 10),
                        ),
                        const SizedBox(
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
                              decoration: const BoxDecoration(
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
                          orderData.buyerName,
                          style: const TextStyle(color: Colors.black, fontSize: 11),
                        ),
                        Text(
                          orderData.buyerPhone,
                          style: TextStyle(color: widget.isupcoming ? Colors.black :Colors.grey.withOpacity(0.6), fontSize: 11),
                        ),
                        Text(
                          ' ${orderData.startedAt}',
                          style: TextStyle(color: widget.isupcoming ? Colors.black :Colors.grey.withOpacity(0.6), fontSize: 11),
                        ),
                      ],
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height*0.03,
                      width: MediaQuery.of(context).size.width*0.21,
                      child: CustomButton(text: 'Call', onPressed: () {  },

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
                              ' ${orderData.duration} hours',
                              style: const TextStyle(fontSize: 11),
                            ),
                            const Text(
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
                              '\$ ${orderData.chargingPrice}',
                              style: const TextStyle(fontSize: 11),
                            ),
                            const Text(
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
                              "\$ ${orderData.parkingPrice}",
                              style: const TextStyle(fontSize: 11),
                            ),
                            const Text(
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
          padding: widget.iscompleted ?const EdgeInsets.all(8) : const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: const Color(0xffDADAD9).withOpacity(0.1), borderRadius: BorderRadius.circular(15),
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
