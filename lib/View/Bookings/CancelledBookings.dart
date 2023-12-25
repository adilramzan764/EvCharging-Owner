import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Model/OrderModel.dart';
import '../../Utils/Widgets/Bookings_Widget.dart';
import '../../View Model/GetOrders_VM.dart';


class CancelledBookings extends StatefulWidget {

  CancelledBookings({Key? key}) : super(key: key);

  @override
  State<CancelledBookings> createState() => _CancelledBookingsState();
}

class _CancelledBookingsState extends State<CancelledBookings> {
  final OrderViewModel orderViewModel = Get.find();

  List<BookingInfo> cancelledOrders = [];

  @override
  void initState() {
    super.initState();
    // Filter the orders for completed ones when this widget initializes
    cancelledOrders = orderViewModel.orders
        .map((orderData) => BookingInfo.fromJson(orderData))
        .where((order) => order.status == "Cancelled")
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: cancelledOrders.isEmpty // Check if completedOrders list is empty
                ? Center(child: Text("No Orders Cancelled yet")) // Show message if empty
                : ListView.builder(
              itemCount: cancelledOrders.length,
              itemBuilder: (BuildContext context, int index) {
                BookingInfo orderModel = cancelledOrders[index];
                print("orderModel : " + orderModel.status);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Bookings_Widget(
                    isupcoming: false,
                    iscompleted: false,
                    iscancelled: true,
                    order: orderModel,
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      ],
    );
  }
}
