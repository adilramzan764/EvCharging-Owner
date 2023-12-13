import 'package:car_charging/Utils/Widgets/Custom%20Button/Custom%20Button.dart';
import 'package:car_charging/View/AccountOption_Screens/MyWallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Model/TransactionHistoryModel.dart';
import '../../Utils/Assets/Assets.dart';
import '../../Utils/Color/Color.dart';
import '../../Utils/Widgets/Transactions_Widget.dart';
import '../AccountOption_Screens/AddCard.dart';
import '../PaymentMethod/SelectPaymentCard_Topup.dart';

class Payment_Management extends StatefulWidget {
   Payment_Management({Key? key}) : super(key: key);

  @override
  State<Payment_Management> createState() => _Payment_ManagementState();
}

class _Payment_ManagementState extends State<Payment_Management> {
   bool isRadioSelected = true;

   int selectedCardIndex = -1;

   List<TransactionHistoryModel> transactionhistory=[
     TransactionHistoryModel(location: 'Davidson Avenue, Vicent', dateandtime: '21 june 2023 - 12:21AM', status: 'Received', amount: '-\$1346', carname: 'Tesla Car''', plugtype: 'Tesla Plug CSI!-Dc', charginghours: 2),
     TransactionHistoryModel(location: 'Davidson Avenue, Vicent', dateandtime: '21 june 2023 - 12:21AM', status: 'Received', amount: '-\$1346', carname: 'Tesla Car''', plugtype: 'Tesla Plug CSI!-Dc', charginghours: 2),
     // TransactionHistoryModel(location: 'Davidson Avenue, Vicent', dateandtime: '21 june 2023 - 12:21AM', status: 'Received', amount: '-\$1346', carname: 'Tesla Car''', plugtype: 'Tesla Plug CSI!-Dc', charginghours: 2),
     // TransactionHistoryModel(location: 'Davidson Avenue, Vicent', dateandtime: '21 june 2023 - 12:21AM', status: 'Received', amount: '-\$1346', carname: 'Tesla Car''', plugtype: 'Tesla Plug CSI!-Dc', charginghours: 2),

   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Center(
                  child: Text(
                    'Payment Management',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: MediaQuery.of(context).size.height *0.01,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        // top: MediaQuery.of(context).size.height * 0.13,
                        left: 25,
                        right: 25),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.14,
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
                              SizedBox(height: 5,),
                              Container(
                                height: MediaQuery.of(context).size.height *0.023,
                                width: MediaQuery.of(context).size.width *0.25,
                                child: CustomButton(text: 'Withdraw', onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectPaymentCard_Topup(), // Replace with your next screen widget.
                                    ),
                                  );
                                },),
            
                              )
                            ],
                          ),
                          Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Transform.scale(
                                    scale: 1.2,
                                    child: SvgPicture.asset(ImageAssets.earning)),
                              ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height *0.03,),
            
                  Container(
                    // height: 40,
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: Text(
                          //     'Your payment cards',
                          //     style: TextStyle(color: Colors.black, fontSize: 13),
                          //   ),
                          // ),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Your payment cards',
                              style: TextStyle(color: Colors.black, fontSize: 13),
                            ),
                          ),
                          SizedBox(height: 10,),
            
                          // First Container
                          buildPaymentCard(0, "assets/debit.png", "**** **** *456"),
            
                          // Second Container
                          buildPaymentCard(1, "assets/debit.png", "**** **** *789"),
            
            
            
                        ],
                      ),
                    ),
                  ),
            
                  SizedBox(height: MediaQuery.of(context).size.height *0.03,),
            
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentMethodProcess(), // Replace with your next screen widget.
                          ),
                        );
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            color: ColorValues.lightblue,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                              '+ Add New Payment Method',
                              style: TextStyle(
                                  color: ColorValues.Blue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )),
                      )),
            
                  SizedBox(height: MediaQuery.of(context).size.height *0.02,),
            
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction History',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(color: ColorValues.Blue, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height *0.02,),
            
                  Container(
                    height: MediaQuery.of(context).size.height *0.155  *transactionhistory.length,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: transactionhistory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 7.0),
                            child: Transactions_Widget( context,transactionhistory[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )






        ],
      ),
    );
  }

  Widget buildPaymentCard(int index, String imagePath, String cardNumber) {
    return Row(
      children: [
        SizedBox(width: 5),
        Image.asset(imagePath),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            cardNumber,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedCardIndex = index;
                });
              },
              child: Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: selectedCardIndex == index
                        ? Colors.blue // Selected color
                        : Colors.grey.withOpacity(0.5), // Unselected color
                  ),
                ),
                child: selectedCardIndex == index
                    ? Center(
                  child: Icon(
                    Icons.circle,
                    size: 12.0,
                    color: Colors.blue, // Selected color
                  ),
                )
                    : SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
