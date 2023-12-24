// active_bookings.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Model/OrderModel.dart';
import '../../Sockets/Sockets.dart';
import '../../Utils/Widgets/Bookings_Widget.dart';




class ActiveBookings extends StatelessWidget {
  final SocketController orderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // Remove the Obx widget from here
          child: ListView.builder(
            itemCount: orderController.order.length,
            itemBuilder: (context, index) {
              final orderMap = orderController.order[index];
              final orderModel = OrderModel.fromJson(orderMap);

              print(orderModel.status);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => Bookings_Widget(
                  isupcoming: true,
                  iscompleted: false,
                  iscancelled: false,
                  order: orderModel,
                )),
              );
            },
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      ],
    );
  }
}
