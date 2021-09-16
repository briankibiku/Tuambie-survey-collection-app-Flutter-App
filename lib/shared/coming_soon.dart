import 'package:flutter/material.dart';
import 'package:tuambie/constants/colors.dart';
import 'package:tuambie/constants/sizing.dart';
import 'package:tuambie/shared/labels/custom_input_label.dart'; 

class ComingSoonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 240,
              width: 240,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40)),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/coming_soon.png'))),
            ),
          ),
          mediumVerticalSizedBox,
          Bold17InputLabel(labelString: 'Feature coming soon'),
          smallVerticalSizedBox,
          CustomInputLabel(
            labelString: 'Keep checking...',
          ),
          largeVerticalSizedBox,
          MaterialButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                side: BorderSide(color: primaryColor)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back', style: TextStyle(color: primaryColor)),
          )
        ],
      ),
    );
  }
}
