// active_bookings.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/OrderModel.dart';
import '../../Sockets/Sockets.dart';
import '../../Utils/Widgets/Bookings_Widget.dart';
import '../../View Model/GetOrders_VM.dart';

class ActiveBookings extends StatefulWidget {
  @override
  State<ActiveBookings> createState() => _ActiveBookingsState();
}

class _ActiveBookingsState extends State<ActiveBookings> {
  final SocketController socketController = Get.find<SocketController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child:Obx(
        () => ListView.builder(
      itemCount: socketController.orderList.length,
      itemBuilder: (context, index) {

        Map<String, dynamic> orderData = socketController.orderList[index];
        BookingInfo orderModel = BookingInfo.fromJson(orderData);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Bookings_Widget(
            isupcoming: true,
            iscompleted: false,
            iscancelled: false,
            order: orderModel,
            index: index,
          ),
        );
      },
        ),
    ),),

        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      ],
    );
  }
}
