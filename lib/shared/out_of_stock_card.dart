import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart'; 
import 'package:tuambie/constants/sizing.dart';

class OutOfStockCard extends StatelessWidget {
  const OutOfStockCard(
      {required this.productName, required this.remainingQuantity});
  final String productName;
  final String remainingQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 60,
      width: 110,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(productName),
          smallVerticalSizedBox,
          Container(
            height: 20,
            width: 90,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
                color: primaryColor),
            child: Text(
              remainingQuantity + ' Remaining',
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
