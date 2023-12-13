import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Model/TransactionHistoryModel.dart';
import '../Color/Color.dart';

Widget Transactions_Widget(
    BuildContext context, TransactionHistoryModel transactionHistoryModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 1),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      transactionHistoryModel.carname,
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '(${transactionHistoryModel.plugtype} )',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
                Text(
                  transactionHistoryModel.dateandtime,
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.7), fontSize: 10),
                ),
                Text(
                  '${transactionHistoryModel.charginghours} hours Charging',
                  style: TextStyle(color: ColorValues.Blue, fontSize: 10),
                ),
              ],
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 18,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorValues.DarkGreen),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      transactionHistoryModel.status,
                      style:
                          TextStyle(color: ColorValues.DarkGreen, fontSize: 10),
                    )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    transactionHistoryModel.amount,
                    style:
                        TextStyle(color: ColorValues.DarkGreen, fontSize: 15),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    ),
  );
}
