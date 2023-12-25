import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Model/OrderModel.dart';
import '../../Sockets/Sockets.dart';
import '../../Utils/Widgets/Bookings_Widget.dart';
import '../../View Model/GetOrders_VM.dart';

class ComplettedBookings extends StatefulWidget {

   ComplettedBookings({Key? key}) : super(key: key);

  @override
  State<ComplettedBookings> createState() => _ComplettedBookingsState();
}

class _ComplettedBookingsState extends State<ComplettedBookings> {
  final OrderViewModel orderViewModel = Get.find();
  List<BookingInfo> completedOrders = [];

  @override
  void initState() {
    super.initState();
    // Filter the orders for completed ones when this widget initializes
    completedOrders = orderViewModel.orders
        .map((orderData) => BookingInfo.fromJson(orderData))
        .where((order) => order.status == "Completed")
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
            child: completedOrders.isEmpty // Check if completedOrders list is empty
                ? Center(child: Text("No Orders Completed yet")) // Show message if empty
                : ListView.builder(
              itemCount: completedOrders.length,
              itemBuilder: (BuildContext context, int index) {
                BookingInfo orderModel = completedOrders[index];
                print("orderModel : " + orderModel.status);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Bookings_Widget(
                    isupcoming: false,
                    iscompleted: true,
                    iscancelled: false,
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
